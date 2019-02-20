//
//  Data.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

extension Data {
    func toUIImage() -> UIImage? {
        return UIImage(data:self)
    }
    
    func toString() -> String {
        return self.base64EncodedString(options: .endLineWithLineFeed)
    }
}
