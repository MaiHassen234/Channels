//
//  HomeScreenUnitTest.swift
//  ChannelsTests
//
//  Created by Mai hassen on 5/12/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import XCTest

class HomeScreenUnitTest: XCTestCase {

        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

       func testFetchingEpisodes() {
            let homeModel = HomeModelMocking()
        homeModel.getEpisodes(completion: {_ in
            
        })
        let firstEpisode = homeModel.media?[0]
        XCTAssertTrue(firstEpisode?.title == "Conscious Parenting", "failed to parse first episode name")
          
        }
        
     func testFetchingScreenData() {
        let homeModel = HomeModelMocking()
        let homeView = HomeViewMocking()
        let presenter = HomePresenter(view: homeView, model: homeModel)
        presenter.viewDidLoad()
                XCTAssertTrue(homeModel.categories?.count == 12,
                              "Failed to return the expected count of categories")

        let firstChannel = homeModel.channels?[0]
               
        XCTAssertTrue(firstChannel?.latestMedia?[0].title == "How Journaling Helped Create a $500M Company",
                      "failed to parse first channel name")
        }
        
        func testFetchDatafromNetwork() {
            
        }
    }
