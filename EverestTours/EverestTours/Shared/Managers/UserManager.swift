//
//  UserManager.swift
//  EverestTours
//
//  Created by kevin on 12/19/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation
import Firebase

class UserManager {
    
    static let sharedInstance: UserManager = {
        return UserManager()
    }()
    
    private let userFSIdentifier = FirebaseCollectionIdentifiers.userAccount
    private let userFSModel:FSModel<User>
    
    private init() {
        userFSModel = FSModel<User>(collectionIdentifier: userFSIdentifier)
    }
    
    func getUser(completion:@escaping (User?, Error?)->Void) {
        if let email = FUIAuthenticationManager.shared.AuthDataResult?.user.email {
            userFSModel.get(byDocumentName: email, completion: completion)
        } else {
            completion(nil,AppError(errorDescription: "No email address authenticated"))
        }
    }
    
    func saveUser(user: User, completion: @escaping (Error?)->Void) {
        if let email = FUIAuthenticationManager.shared.AuthDataResult?.user.email {
            userFSModel.save(withDocumentName: email, model: user, completion: completion)
        } else {
            completion(AppError(errorDescription: "No email address authenticated"))
        }
    }
}
