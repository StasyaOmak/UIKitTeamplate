// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для ввода логина и пароля
final class RegistrationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var loginTextField: UITextField?
    @IBOutlet var passwordTextField: UITextField?
    @IBAction func sendPressedButton(sender: UIButton) {}
    @IBOutlet var sendisEnabledButton: UIButton?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField?.delegate = self
        loginTextField?.delegate = self
        sendisEnabledButton?.isEnabled = false
    }
}

// MARK: - Extension

extension RegistrationViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let password = passwordTextField?.text ?? ""
        let login = loginTextField?.text ?? ""

        let isPasswordValid = password.count > 1
        let isLoginValid = login.count > 1

        sendisEnabledButton?.isEnabled = isPasswordValid && isLoginValid
        sendisEnabledButton?.isEnabled = true

        return true
    }
}
