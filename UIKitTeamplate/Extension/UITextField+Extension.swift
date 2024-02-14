// UITextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Extension UITextFieldDelegate

// Расширение для проверки условий для ввода пароля и логина при котором кнопка логина активна или нет
extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if email.count > 1, password.count > 1 {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        }

        return true
    }
}
