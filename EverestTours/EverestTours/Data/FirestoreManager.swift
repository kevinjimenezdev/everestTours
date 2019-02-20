//
//  FirestoreManager.swift
//  EverestTours
//
//  Created by kevin on 2/6/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation
import Firebase

class FirestoreManager {
    
    // MARK: - Shared
    static let sharedInstance: FirestoreManager = {
        return FirestoreManager()
    }()
    
    let db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
}
