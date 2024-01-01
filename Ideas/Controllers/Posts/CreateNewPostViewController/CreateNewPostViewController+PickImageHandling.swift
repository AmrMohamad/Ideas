//
//  CreateNewPostViewController+PickImageHandling.swift
//  Ideas
//
//  Created by Amr Mohamad on 29/12/2023.
//

import UIKit

extension CreateNewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as? UIImage
        if let selectedImage = image {
            headerImage.image = selectedImage
            self.selectedHeaderImage = selectedImage
        }
        dismiss(animated: true)
    }
}
