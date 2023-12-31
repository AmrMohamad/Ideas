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
        OfPostForUser user: User,
        image: UIImage?,
        completion: @escaping (URL?) -> Void
    ) {
        let compressedImage = image?.jpegData(compressionQuality: 0.08)
        let imagePathRec = storage.reference()
            .child("Posts_images")
            .child(user.getDocumentID)
            .child("\(UUID().uuidString).jpeg")
        if let uploadedImage = compressedImage {
            let uploadTask = imagePathRec.putData(uploadedImage, metadata: nil) { _, error in
                if error != nil {
                    print("error with uploading image:\n\(error!.localizedDescription)")
                    return
                }
                imagePathRec.downloadURL { url, _ in
                    if let safeURL = url {
                        completion(safeURL)
                    }else{
                        completion(nil)
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    public func downloadBlogHeaderImage(
        blogPost: BlogPost,
        completion: @escaping (URL?) -> Void
    ){
        
    }
}
