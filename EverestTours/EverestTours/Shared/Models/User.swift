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
    
    init(profile: UserProfile?){
        self.profile = profile
    }
    private enum CodingKeys: String, CodingKey {
        case profile
    }
}

