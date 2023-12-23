//
//  DatabaseManager.swift
//  Ideas
//
//  Created by Amr Mohamad on 18/12/2023.
//

import FirebaseFirestore
import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    public func insert(
        BlogPost post: BlogPost,
        of user: User,
        completion: @escaping (Bool) -> Void
    ){
        
    }
    
    public func getAllPosts(
        completion: @escaping ([BlogPost]) -> Void
    ){
        
    }
    
    public func getPosts(
        for user: User,
        completion: @escaping ([BlogPost]) -> Void
    ){
        
    }
    
    public func insertUser(
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
}
