//
//  Tour.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation

struct Tour: Codable {
    var identifier: String?
    var date: Double?
    var route: [String]?
    var guideName: String?
    var spotLimit: Int?
    var reservedSpots: Int?
    
    var startsAt: String? {
        get {
            if route?.count ?? 0 > 0 {
                return route?[0]
            }
            return nil
        }
    }
    
    init(identifier: String?, date: Double?, route: [String]?, guideName: String?, reservedSpots: Int? = 0, spotLimit: Int? = SharedConstants.tourDefautMaxSpots) {
        self.identifier = identifier
        self.date = date
        self.route = route
        self.guideName = guideName
        self.spotLimit = spotLimit
        self.reservedSpots = reservedSpots
    }
    
    private enum CodingKeys: String, CodingKey {
        case identifier
        case date
        case route
        case guideName = "guide_name"
        case spotLimit = "spot_limit"
        case reservedSpots = "reserved_sports"
    }
}
