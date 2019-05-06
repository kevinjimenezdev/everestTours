//
//  GuideCollectionViewCell.swift
//  EverestTours
//
//  Created by kevin on 5/5/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GuideCollectionViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var toursGivenLabel: UILabel!
    
    var guide: Guide?
    
    func set(guide: Guide) {
        self.guide = guide
        nameLabel.text = guide.name
        descriptionLabel.text = guide.extra
        toursGivenLabel.text = String(guide.toursGiven ?? 0)
    }
    
}
