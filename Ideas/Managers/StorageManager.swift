//
//  StorageManager.swift
//  Ideas
//
//  Created by Amr Mohamad on 18/12/2023.
//

import FirebaseStorage
import UIKit

final class StorageManager {
    static let shared = StorageManager()
    private let storage = Storage.storage()

    private init() {}
    
    public func uploadProfilePictureOf(
        user: User,
        image: UIImage?,
        completion: @escaping (Bool) -> Void
    ) {
        let userImagesRef = user.getDocumentID
        let imageCompressed = image?.jpegData(compressionQuality: 0.05)
        let imageTitle = UUID().uuidString
        let storageRec = storage.reference()
            .child("chat_images")
            .child(userImagesRef)
            .child("\(imageTitle).jpeg")
        if let uploadedImage = imageCompressed {
            let uploadTask = storageRec.putData(uploadedImage, metadata: nil) { _, error in
                if error != nil {
                    print("error with uploading image:\n\(error!.localizedDescription)")
                    return
                }
                storageRec.downloadURL { url, _ in
                    if let safeURL = url {
                        let info: [String: Any] = [
                            "profilePictureURL" : safeURL.absoluteString
                        ]
                        DatabaseManager.shared
                            .addNewInfoTo(
                                user: user,
                                newInfo: info) { updated in
                                    if updated {
                                        completion(true)
                                    }else{
                                        completion(false)
                                    }
                                }
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    public func downloadProfilePictureFor(
        user: User,
        completion: @escaping (URL?) -> Void
    ){
        
    }
    
    public func uploadBlogHeaderImage(
        blogPost: BlogPost,
        image: UIImage?,
        completion: @escaping (Bool) -> Void
    ) {
        
    }
    
    public func downloadBlogHeaderImage(
        blogPost: BlogPost,
        completion: @escaping (URL?) -> Void
    ){
        
    }
}
