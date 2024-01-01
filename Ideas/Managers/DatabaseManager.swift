//
//  DatabaseManager.swift
//  Ideas
//
//  Created by Amr Mohamad on 18/12/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func insert(
        BlogPost post: BlogPost,
        of user: User,
        completion: @escaping (Bool) -> Void
    ){
        let data: [String:Any] = [
            "identifier": post.identifier,
            "headrImageURL": post.headrImageURL ?? NSNull(),
            "title": post.title,
            "text": post.text,
            "timestamp": post.timestamp
        ]
        db.collection("blogs")
            .document(post.identifier)
            .setData(data) { error in
            if error == nil {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
    
    func getAllPosts(
        completion: @escaping ([BlogPost]) -> Void
    ){
        
    }
    
    func getPosts(
        for user: User,
        completion: @escaping ([BlogPost]) -> Void
    ){
        
    }
    
    func insertUser(
        _ user: User,
        completion: @escaping (Bool) -> Void
    ){
        let docID = user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        let data : [String:Any] = [
            "name": user.name,
            "email": user.email,
            "profilePictureURL": user.profilePictureURL ?? NSNull()
        ]
        db.collection("user")
            .document(docID)
            .setData(data) { error in
                completion(error == nil)
            }
    }
    
    func getUserInfo(complation: @escaping (User)->Void){
        let docID = Auth.auth()
            .currentUser?
            .email?
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        if let documentID = docID {
            db.collection("user")
                .document(documentID)
                .addSnapshotListener { documentSnapshot, error in
                    if let docSnap = documentSnapshot{
                        if let data = docSnap.data(){
                            let user = User(
                                name: data["name"] as! String,
                                email: data["email"] as! String,
                                profilePictureURL: data["profilePictureURL"] as? String
                            )
                            
                            complation(user)
                        }
                    }
                }
        }
    }
    
    func addNewInfoTo(
        user:User,
        newInfo: [String: Any] ,
        completion: @escaping (Bool) -> Void
    ){
        let docID = user.getDocumentID
        
        db.collection("user")
            .document(docID)
            .updateData(newInfo) { error in
                completion(error == nil)
            }

    }
}
