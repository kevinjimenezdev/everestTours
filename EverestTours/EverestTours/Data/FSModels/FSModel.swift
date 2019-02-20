//
//  FBModel.swift
//  EverestTours
//
//  Created by kevin on 2/7/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Firebase

class FSModel<Model: Codable> {
    
    let db = FirestoreManager.sharedInstance.db
    var collectionIdentifier: String
    
    init(collectionIdentifier: String) {
        self.collectionIdentifier = collectionIdentifier
    }
    
//    func getAll(completion: ([Model]?, Error?)->Void){
//        db.collection(collectionIdentifier).getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                //Log Error
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    //Convert to Model
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
//    }
    
    func get(byDocumentName documentName: String, completion: @escaping (Model?, Error?)->Void) {
        db.collection(collectionIdentifier).document(documentName).getDocument() { document, error in
            if (document?.exists ?? false) {
                if let data = document?.data() {
                    do {
                      return try completion(Model.asModel(data: data), error)
                    } catch {
                     completion(nil, error)
                    }
                }
            } else {
                return completion(nil, error)
            }
        }
    }
    
    func save(withDocumentName documentName: String, model: Model, completion: @escaping (Error?)->Void) {
        var dataDiccionary: [String: Any]?
        do {
            dataDiccionary = try model.asDictionary()
        } catch {
            completion(AppError(errorDescription: "Could not convert model to diccionary"))
        }

        db.collection(collectionIdentifier).document(documentName).setData(dataDiccionary!) { err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
}
