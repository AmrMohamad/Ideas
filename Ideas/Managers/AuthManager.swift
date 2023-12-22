//
//  AuthManager.swift
//  Ideas
//
//  Created by Amr Mohamad on 18/12/2023.
//

import FirebaseAuth
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()

    private init() {}

    var isSignedIn: Bool {
        return auth.currentUser != nil
    }

    func signUp(
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        guard !email.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty,
              !password.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty,
              password.count >= 6 else { return }
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                print(error!)
                return
            }
            
            completion(true)
        }
    }

    func signIn(
        email: String,
        password: String,
        completion: @escaping (Bool,String?) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false,error!.localizedDescription)
                print(error!)
                return
            }
            
            completion(true,nil)
        }
    }

    func signOut(
        completion: (Bool) -> Void
    ) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
}
