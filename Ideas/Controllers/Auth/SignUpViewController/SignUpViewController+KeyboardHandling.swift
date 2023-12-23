//
//  SignUpViewController+KeyboardHandling.swift
//  Ideas
//
//  Created by Amr Mohamad on 23/12/2023.
//

import UIKit

extension SignUpViewController {
    func initializeHideKeyboard() {
        // Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard)
        )
        // Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }

    @objc func dismissMyKeyboard() {
        // endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        // In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
}
