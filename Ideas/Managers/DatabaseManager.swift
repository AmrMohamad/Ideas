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
        
    }
}
