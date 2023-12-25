//
//  User.swift
//  Ideas
//
//  Created by Amr Mohamad on 21/12/2023.
//

import Foundation

struct User{
    let name: String
    let email: String
    let profilePictureURL: String?
    
    var getDocumentID : String{
        return email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
    }
}
