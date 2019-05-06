//
//  Guide.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation
struct Guide : Codable {
    var identifier: String?
    var name: String?
    var toursGiven: Int?
    var extra: String?
    
    init(identifier: String?, name: String?, toursGiven: Int? = 0, extra: String? = nil) {
        self.identifier = identifier
        self.name = name
        self.extra = extra
    }
    
    private enum CodingKeys: String, CodingKey {
        case identifier
        case name
        case toursGiven = "tours_given"
        case extra
    }
}
