//
//  Reservation.swift
//  EverestTours
//
//  Created by kevin on 1/10/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

struct Reservation: Codable {
    var tourId: String?
    var reservedSpots: Int?
    
    init(tourId:String, reservedSports: Int) {
        self.tourId = tourId
        self.reservedSpots = reservedSports
    }
    
    private enum CodingKeys: String, CodingKey {
        case reservedSpots = "reserved_spots"
        case tourId = "tour_id"
    }
}
