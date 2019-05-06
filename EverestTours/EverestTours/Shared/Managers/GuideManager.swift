//
//  GuideManager.swift
//  EverestTours
//
//  Created by kevin on 5/6/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation

class GuideManager {
    static let sharedInstance: GuideManager = {
        return GuideManager()
    }()
    
    private let guideFSIdentifier = FirebaseCollectionIdentifiers.guide
    private let guideFSModel:FSModel<Guide>
    
    private init() {
        guideFSModel = FSModel<Guide>(collectionIdentifier: guideFSIdentifier)
    }
    
    func getAllGuides(completion:@escaping ([Guide]?, Error?)->Void) {
        guideFSModel.getAll(completion: completion)
    }
}
