//
//  ProfileViewController+PickImageHandling.swift
//  Ideas
//
//  Created by Amr Mohamad on 25/12/2023.
//

import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        }else if let selectedOriginalImage = info[.originalImage] as? UIImage {
            selectedImageFromPicker = selectedOriginalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            StorageManager.shared
                .uploadProfilePictureOf(
                    user: user!,
                    image: selectedImage) { [weak self] uploaded in
                        dump(self?.user)
                        if uploaded {
                            if let url = self?.user?.profilePictureURL {
                                DispatchQueue.main.async {
                                    self?.profilePictureHeader.loadImagefromCacheWithURLstring(urlString: url)
                                }
                            }
                        }
                    }
            dismiss(animated: true)
        }
    }
}
