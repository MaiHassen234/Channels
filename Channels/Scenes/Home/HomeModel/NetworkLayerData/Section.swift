//
//  Section.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

enum SectionType {
    case episode
    case series
    case course
    case categories
}
struct Section: Hashable {
    var type: SectionType
    let uuid = UUID()
    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
struct SectionObject<U: Hashable, T: Hashable, V: Hashable>: Hashable {
    let channels: U?
    let media: T?
    let categories: V?
}
