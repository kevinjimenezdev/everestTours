//
//  UIImage.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

extension UIImage {
    func toData() -> Data? {
        return self.pngData()
    }
}
