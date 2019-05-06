//
//  Date.swift
//  EverestTours
//
//  Created by kevin on 2/28/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

extension Date {
    var millisecondsSince1970:Double {
        return Double((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
