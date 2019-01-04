//
//  Tour.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation

struct Tour {
    var identifier: String
    var date: Date
    var route: [String]
    var guide: Guide
    var spotLimit: Int
    var reservedSpots: Int
    
    var startsAt: String? {
        get {
            if route.count > 0 {
                return route[0]
            }
            return nil
        }
    }
    
    init(identifier: String, date: Date, route: [String], guide: Guide, reservedSpots: Int = 0, spotLimit: Int = SharedConstants.tourDefautMaxSpots) {
        self.identifier = identifier
        self.date = date
        self.route = route
        self.guide = guide
        self.spotLimit = spotLimit
        self.reservedSpots = reservedSpots
    }
}
