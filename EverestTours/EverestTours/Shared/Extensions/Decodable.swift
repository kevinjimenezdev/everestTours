//
//  Decodable.swift
//  EverestTours
//
//  Created by kevin on 2/8/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

extension Decodable {
    static func asModel(data: [String:Any]) throws -> Self {
        let json = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        let model = try JSONDecoder().decode(Self.self, from: json)
        return model
    }
}
