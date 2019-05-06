//
//  GuideCollectionCollectionViewController.swift
//  EverestTours
//
//  Created by kevin on 5/5/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GuideCollectionViewController: UICollectionViewController {
    
    var guides: [Guide]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GuideManager.sharedInstance.getAllGuides { (guides, error) in
            self.guides = guides
            self.collectionView.reloadData()
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guides?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GuideCollectionViewCell.identifier, for: indexPath) as! GuideCollectionViewCell
        if let guides = guides {
           cell.set(guide: guides[indexPath.row])
        }
        return cell
    }
}
