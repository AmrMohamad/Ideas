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
    
    public func insertBlogPost(
        with post: String,
        user: String,
        completion: @escaping (Bool) -> Void
    ){
        
    }
    
    public func getAllPosts(
        for user: String,
        completion: @escaping ([String]) -> Void
    ){
        
    }
    
    public func getPostsFor(
        _ user: String,
        completion: @escaping ([String]) -> Void
    ){
        
    }
    
    public func insertUser(
        _ user: String,
        completion: @escaping (Bool) -> Void
    ){
        
    }
}
