//
//  Guide.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation
struct Guide {
    var identifier: String
    var name: String
    var extra: String?
    
    init(identifier: String, name: String, extra: String? = nil) {
        self.identifier = identifier
        self.name = name
        self.extra = extra
    }
}
