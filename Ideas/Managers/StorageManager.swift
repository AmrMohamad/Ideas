//
//  StorageManager.swift
//  Ideas
//
//  Created by Amr Mohamad on 18/12/2023.
//

import FirebaseStorage
import Foundation

final class StorageManager {
    static let shared = StorageManager()
    private let storage = Storage.storage()

    private init() {}
}
