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
    
    func getAll(completion: @escaping ([Model]?, Error?)->Void){
        db.collection(collectionIdentifier).getDocuments { querySnapshot, error in
            self.adaptModelArray(querySnapshot: querySnapshot, error: error, completion: completion)
        }
    }
    
    func get(byDocumentName documentName: String, completion: @escaping (Model?, Error?)->Void) {
        db.collection(collectionIdentifier).document(documentName).getDocument() { document, error in
            if (document?.exists ?? false) {
                if let data = document?.data() {
                    do {
                      return try completion(Model.asModel(data: data), error)
                    } catch {
                     return completion(nil, error)
                    }
                }
            } else {
                return completion(nil, error)
            }
        }
    }
    
    func get(byIdentifier identifier: String, completion: @escaping ([Model]?, Error?)->Void) {
        let query = db.collection(collectionIdentifier)
        query.whereField("identifier", isEqualTo: identifier).getDocuments { (querySnapshot, error) in
            self.adaptModelArray(querySnapshot: querySnapshot, error: error, completion: completion)
        }
    }
    
    func save(withDocumentName documentName: String, model: Model, completion: @escaping (Error?)->Void) {
        var dataDiccionary: [String: Any]?
        do {
            dataDiccionary = try model.asDictionary()
        } catch {
            return completion(AppError(errorDescription: "Could not convert model to diccionary"))
        }
        db.collection(collectionIdentifier).document(documentName).setData(dataDiccionary ?? [:], completion: completion)
    }
    
    func save(byIdentifier identifier: String, model: Model, completion: @escaping (Error?)->Void) {
        let query = db.collection(collectionIdentifier)
        query.whereField("identifier", isEqualTo: identifier).getDocuments { (querySnapshot, error) in
            if let document = querySnapshot?.documents[0] {
                self.save(withDocumentName: document.documentID, model: model, completion: completion)
            }
        }
    }
    
    func save(model: Model, completion: @escaping(Error?)->Void) {
        var dataDiccionary: [String: Any]?
        do {
            dataDiccionary = try model.asDictionary()
        } catch {
            return completion(AppError(errorDescription: "Could not convert model to diccionary"))
        }
        db.collection(collectionIdentifier).addDocument(data: dataDiccionary ?? [:], completion: completion)
    }
}

extension FSModel {
    func adaptModelArray(querySnapshot: QuerySnapshot?, error: Error?, completion: @escaping ([Model]?, Error?)->Void) {
        if let documents = querySnapshot?.documents {
            
            var modelCollection: [Model] = []
            
            for document in documents {
                let data = document.data()
                do {
                    let documentData = try Model.asModel(data: data)
                    modelCollection.append(documentData)
                } catch {
                    print("Error converting documents")
                }
            }
            completion(modelCollection, error)
        } else {
            print("No documents")
        }
    }
}
