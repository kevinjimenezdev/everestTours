//
//  String.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

extension String {
    func toData() -> Data? {
        return Data(base64Encoded: self, options: .ignoreUnknownCharacters)
    }
}
