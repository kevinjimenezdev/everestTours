//
//  User.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

class User: Codable {
    var profile: UserProfile?
    var reservations: [Reservation]?
    
    init(profile: UserProfile?, reservations: [Reservation]? = []){
        self.profile = profile
        self.reservations = reservations
    }
    private enum CodingKeys: String, CodingKey {
        case profile
        case reservations
    }
}

