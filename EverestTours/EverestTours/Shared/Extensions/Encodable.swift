//
//  Encodable.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
