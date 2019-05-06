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
    static var currentUser: User?
    
    private let userFSIdentifier = FirebaseCollectionIdentifiers.userAccount
    private let userFSModel:FSModel<User>
    
    private init() {
        userFSModel = FSModel<User>(collectionIdentifier: userFSIdentifier)
    }
    
    func getUser(completion:@escaping (User?, Error?)->Void) {
        if let email = FUIAuthenticationManager.shared.AuthDataResult?.user.email {
            userFSModel.get(byDocumentName: email, completion: {(user, error) in
                UserManager.currentUser = user
                completion(user,error)
            })
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
    
    func saveCurrentUser(completion: @escaping (Error?)->Void) {
        if let currentUser = UserManager.currentUser {
            self.saveUser(user: currentUser, completion: completion)
        }
    }
}
