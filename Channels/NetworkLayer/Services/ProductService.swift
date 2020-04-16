//
//  ProductService.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable  force_unwrapping

enum  UserServices {
    
    case login(accessToken: String)
    case subjects
    case consultants(subject: String, unbooked: Bool, page: Int)
    case bsa(subject: String, unbooked: Bool, page: Int)
    case availablesessions(token: String, contributerId: String, page: Int)
    case companies(token: String)
    case fcmToken(fcmToken: String, token: String)
    case confirmBooking(token: String, scheduleId: String, purpose: String, companyId: String?, communicationType: Int)
    case sessions
    case logout(token: String, fcmToken: String)
    case validate(token: String, sessionId: String)
    case profile(token: String)
    case upcommingSessions(token: String, companyId: String?, page: Int)
    case historySessions(token: String, companyId: String?, page: Int)
    case getRecomendation(token: String, sessionId: String)
    case questionnaireQuestions(token: String, sessionId: String)
    case questionnaireAnswers(token: String, sessionId: String, ratingQuestionsResult: RatingQuestionsResult)
    case contributorProfile(token: String, contributorId: String)
    case uploadSmeUserProfileImage(token: String, imageData: Data?)
    case termsAndConditions(token: String)
    case contactUs
    
    case instantMeeting(token: String, sessionId: String)
    case endMeeting(token: String, sessionId: String, forceEnded: Bool?)
    case instantBooking(token: String,
        scheduleId: String,
        sessionId: String,
        companyId: String?,
        purpose: String)
    case sessionDetails(token: String, scheduleId: String)
    case cancelSession(scheduleId: String, reason: String)
    case notifications(token: String, page: Int)
    case updateReadStatus(token: String, id: String)
    case meetingOngoing(token: String, sessionId: String, met: Int)
    
}

extension UserServices: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/authentication/sme/login"
            
        case .subjects:
            return "/api/dashboard/subjects"
            
        case .consultants:
            return "/api/profile/consultants"
            
        case .bsa:
            return "/api/profile/bsa"
            
        case .availablesessions( _, let contributerId, _ ):
            return "api/schedule/contributor/\(contributerId)"
            
        case .meetingOngoing(_, let sessionId, _):
            return "api/schedule/sessions/\(sessionId)"
            
        case .companies:
            return "/api/profile/sme/companies"
            
        case .confirmBooking(_, let scheduleId, _, _, _):
            return "/api/schedule/\(scheduleId)/session/store"
            
        case .fcmToken:
            return "/api/profile/sme/fcm-token"
            
        case .sessions:
            return "/api/schedule/sme/sessions"
            
        case .logout:
            return "/api/authentication/logout"
            
        case .validate(_, let sessionId):
            return "/api/schedule/\(sessionId)/validate/sme"
            
        case .profile:
            return "/api/profile/sme"
        case .upcommingSessions:
            return "/api/schedule/sme/sessions"
        case .historySessions:
            return "/api/schedule/sme/sessions/history"
            
        case .questionnaireQuestions(_, let sessionId):
            return "/api/rating/sessions/\(sessionId)/questionnaires"
            
        case .questionnaireAnswers(_, let sessionId, _):
            return "/api/rating/sessions/\(sessionId)/questionnaires"
            
        case .contributorProfile(_, let contributorId):
            return "/api/profile/contributor/\(contributorId)"
            
        case .uploadSmeUserProfileImage:
            return "/api/uploader/sme/file"
            
        case .getRecomendation(_, let sessionId):
            return "/api/rating/sme/sessions/\(sessionId)"
        case .termsAndConditions:
            return "/api/dashboard/settings/terms_and_conditions"
        case .contactUs:
            return "/api/dashboard/settings"
        case .instantMeeting(_, let sessionId):
            return "/api/schedule/\(sessionId)/instant-book"
        case .endMeeting(_, let sessionId, _):
            return "/api/schedule/sessions/\(sessionId)/end"
        case .instantBooking(_, let secheduleId, _, _, _):
            return "/api/schedule/\(secheduleId)/instant-confirm"
        case .sessionDetails(_, let id):
            return "/api/schedule/\(id)/details"
        case .cancelSession(let scheduleId, _ ):
            return "/api/schedule/cancel/\(scheduleId)"
        case .notifications:
            return "/api/schedule/notifications-list/sme"
        case .updateReadStatus(_, let id):
            return "/api/schedule/notification/\(id)"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .login,
             .confirmBooking,
             .fcmToken,
             .logout,
             .validate,
             .questionnaireAnswers,
             .uploadSmeUserProfileImage,
             .instantMeeting,
             .endMeeting,
             .instantBooking,
             .cancelSession,
             .updateReadStatus,
             .meetingOngoing:
            return .post
            
        case .subjects,
             .consultants,
             .bsa,
             .availablesessions,
             .getRecomendation,
             .companies,
             .sessions,
             .profile,
             .upcommingSessions,
             .historySessions,
             .questionnaireQuestions,
             .contributorProfile,
             .termsAndConditions,
             .contactUs,
             .sessionDetails,
             .notifications:
            return .get
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let accessToken):
            return .requestParameters(
                parameters: ["access_token": "Bearer "+accessToken],
                encoding: URLEncoding.default)
            
        case .subjects, .sessions:
            return .requestPlain
            
        case  .consultants (let subject, _, let page):
            return .requestParameters(parameters: ["by": subject,
                                                   "page": page], encoding: URLEncoding.default)
            
        case .bsa(let subject, _, let page):
            return .requestParameters(parameters: ["by": subject,
                                                   "page": page], encoding: URLEncoding.default)
            
        case .availablesessions(_, _, let page):
            return .requestParameters(parameters: ["page": page],
                                      encoding: URLEncoding.default)
            
        case .confirmBooking(_, _, let purpose, let companyId, let communicationType):
            
            var parameters: [String: Any] = ["purpose": purpose,
                                             "type": communicationType]
            if let company = companyId {
                parameters["company_id"] = company
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .companies:
            return .requestPlain
            
        case .fcmToken(let fcmToken, _):
            return .requestParameters(parameters: ["token": fcmToken, "device_type": 1], encoding: URLEncoding.default)
            
        case .logout(_, let fcmToken):
            return .requestParameters(parameters: ["fcm_token": fcmToken], encoding: URLEncoding.default)
            
        case .validate:
            return .requestPlain
            
        case .profile:
            return .requestPlain
        case .upcommingSessions(_, let companyId, let page):
            var parameters: [String: Any] = [:]
            if let company = companyId {
                parameters = ["company": company, "page": page]
            } else {
                parameters = ["page": page]
            }
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .historySessions(_, let companyId, let page):
            var parameters: [String: Any] = ["with": "rates"]
            if let company = companyId {
                parameters =   ["company": company, "page": page, "with": "rates"]
            } else {
                parameters = ["page": page, "with": "rates"]
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .questionnaireQuestions:
            return .requestPlain
            
        case .questionnaireAnswers(_, _, let ratingQuestionsResult):
            return .requestParameters(parameters: ratingQuestionsResult.dictionaryRepresentation(),
                                      encoding: JSONEncoding.default)
            
        case .contributorProfile:
            return .requestPlain
            
        case .uploadSmeUserProfileImage(_, let imageData):
            guard let imageData = imageData else { return .requestPlain }
            let formData = [Moya.MultipartFormData(provider: .data(imageData),
                                                   name: "file",
                                                   fileName: "sme_user_image.jpeg",
                                                   mimeType: "image/jpeg")]
            return .uploadCompositeMultipart(formData,
                                             urlParameters: [:])
            
        case .getRecomendation:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            
        case .termsAndConditions:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .contactUs:
            return .requestPlain
            
        case .instantMeeting:
            return .requestPlain
        case .endMeeting(_, _, let forceEnded):
            if let forceEnd = forceEnded {
                return .requestParameters(parameters: ["force_end": forceEnd], encoding: URLEncoding.default)
            } else {
                return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            }
        case .instantBooking(_, _, let sessionId, let companyId, let purpose):
            var parameters: [String: Any] = ["purpose": purpose,
                                             "session_id": sessionId]
            if let company = companyId {
                parameters["company_id"] = company
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .sessionDetails:
            return .requestPlain
        case .cancelSession(_, let reason):
            return .requestParameters(parameters: ["reason": reason], encoding: URLEncoding.default)
        case .notifications(_, let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
        case .updateReadStatus:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            
        case .meetingOngoing(_, _, let met):
            return .requestParameters(parameters:  ["met": met], encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .availablesessions:
            return nil
            
        case .confirmBooking(let token, _, _, _, _):
           
            return ["Authorization": "Bearer \(token)"]
            
        case .companies(let token):
            
            return ["Authorization": "Bearer \(token)"]
        case .sessions:
             print("access_tokenn", UserDefaults.standard.string(forKey:
             "userToken"))
            return ["Authorization":
                "Bearer" + (UserDefaults.standard.string(forKey:
                    "userToken") ?? "")]
            
        case .fcmToken(_, let token):
            return ["Authorization": "Bearer \(token)"]
            
        case .logout(let token, _):
            return ["Authorization": "Bearer \(token)"]
            
        case .validate(let token, _):
            return ["authorization": "Bearer " + token]
            
        case .questionnaireQuestions(let token, _):
            return ["authorization": "Bearer " + token]
            
        case .questionnaireAnswers(let token, _, _):
            return ["authorization": "Bearer " + token]
            
        case .contributorProfile(let token, _):
            return ["authorization": "Bearer " + token]
            
        case .profile(let token):
            return ["authorization": "Bearer "+token]
            
        case .upcommingSessions(let token, _, _):
            return ["authorization": "Bearer "+token]
        case .historySessions(let token, _, _):
            return ["authorization": "Bearer "+token]
            
        case .uploadSmeUserProfileImage(let token, _):
            return ["Authorization": "Bearer \(token)"]
            
        case .getRecomendation(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .termsAndConditions(let token):
            return ["Authorization": "Bearer \(token)"]
        case .instantMeeting(let token, _):
            return ["authorization": "Bearer " + token,
                    "Accept": "application/json"]
        case .endMeeting(let token, _, _):
            return ["authorization": "Bearer " + token,
                    "Accept": "application/json"]
        case .instantBooking(let token, _, _, _, _):
            return ["authorization": "Bearer " + token,
                    "Accept": "application/json"]
        case .sessionDetails(let token, _):
            return ["authorization": "Bearer " + token]
        case .cancelSession:
            
            return ["authorization": "Bearer " + (AppPreferences.userToken ?? ""),
                    "Accept": "application/json"]
        case .notifications(let token, _):
            return ["authorization": "Bearer "+token]
        case .updateReadStatus(let token, _):
            return ["authorization": "Bearer "+token]
        case .meetingOngoing(let token, _, _):
            return ["authorization": "Bearer "+token]
        default:
            return nil
            
        }
        
    }
    
}
