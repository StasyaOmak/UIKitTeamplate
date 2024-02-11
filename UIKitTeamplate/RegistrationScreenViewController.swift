// RegistrationScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отвечает за регистрацию пользователя при входе в приложение
final class RegistrationScreenViewController: UIViewController {
    // MARK: - Lazy Properties

    private lazy var calendarImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        element.image = UIImage(named: "calendar")
        return element
    }()

    private lazy var birthdayReminderLabel: UILabel = {
        let element = UILabel()
        element.text = "Birthday\nReminder"
        element.numberOfLines = 2
        element.textAlignment = .center
        element.textColor = UIColor(named: "extraColor")
        element.font = .systemFont(ofSize: 18, weight: .bold)
        element.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        return element
    }()

    private lazy var signInLabel: UILabel = {
        let element = UILabel()
        element.text = "Sign in"
        element.textColor = UIColor(named: "mainColor")
        element.font = .systemFont(ofSize: 26, weight: .bold)
        element.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        return element
    }()

    private lazy var emailLabel: UILabel = {
        let element = UILabel()
        element.text = "Email"
        element.textColor = UIColor(named: "mainColor")
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        return element
    }()

    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.text = "Password"
        element.textColor = UIColor(named: "mainColor")
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        return element
    }()

    private lazy var passwordGreyLine: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var emailGreyLine: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var faceIdTextLabel: UILabel = {
        let element = UILabel()
        element.text = "Use FaceID"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 86, y: 544, width: 150, height: 35)
        return element
    }()

    private lazy var loginButton: UIButton = {
        let element = UIButton(type: .system)
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.tintColor = .white
        element.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        element.setTitle("Login", for: .normal)
        element.backgroundColor = UIColor(named: "mainColor")
        element.layer.cornerRadius = 12
        return element
    }()

    private lazy var switchItem: UISwitch = {
        let element = UISwitch()
        element.frame = CGRect(x: 248, y: 544, width: 0, height: 0)
        return element
    }()

    private lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Typing email"
        element.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        return element
    }()

    private lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Typing password"
        element.isSecureTextEntry = true
        element.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        return element
    }()

    private lazy var hidenEyeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: "hiddenEye"), for: .normal)
        element.tintColor = .gray
        element.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        return element
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        checkTextInput()
    }

    // MARK: - Private Methods

    private func setupViews() {
        view.addSubview(calendarImageView)
        view.addSubview(birthdayReminderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordGreyLine)
        view.addSubview(emailGreyLine)
        view.addSubview(passwordLabel)
        view.addSubview(hidenEyeButton)
        view.addSubview(passwordTextField)
        view.addSubview(faceIdTextLabel)
        view.addSubview(switchItem)
        view.addSubview(loginButton)

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    private func checkTextInput() {
        let userNameText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""

        if userNameText.isEmpty || passwordText.isEmpty {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
            switchItem.isHidden = true
            faceIdTextLabel.isHidden = true
        } else {
            loginButton.isEnabled = true
            loginButton.alpha = 1
            switchItem.isOn = true
            switchItem.isHidden = false
            faceIdTextLabel.isHidden = false
        }
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        checkTextInput()
    }

    @objc private func loginButtonTapped() {
        let birthdayViewController = BirthdayReminderViewController()
        navigationController?.pushViewController(birthdayViewController, animated: true)
    }
}
