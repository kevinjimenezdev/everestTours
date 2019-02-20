//
//  UserProfile.swift
//  EverestTours
//
//  Created by kevin on 2/6/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class UserProfile: Codable {
    var email: String?
    var name: String?
    var phone: String?
    var image: String?
    
    init(email: String?, name: String?, phone: String?, image: String?) {
        self.email = email
        self.name = name
        self.phone = phone
        self.image = image
    }
    
    init(email: String?, name: String?, phone: String?, image: UIImage?) {
        self.email = email
        self.name = name
        self.phone = phone
        setProfile(image: image)
    }
    
    func getProfileImage() -> UIImage? {
        return image?.toData()?.toUIImage()
    }
    
    func setProfile(image: UIImage?) {
        self.image = image?.toData()?.toString()
    }
    
    private enum CodingKeys: String, CodingKey {
        case email
        case name
        case phone
        case image
    }
}

