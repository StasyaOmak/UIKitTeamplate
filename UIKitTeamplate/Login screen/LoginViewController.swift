// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отвечает за авторизацию пользователя при входе в приложение
final class LoginViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var whitePartOfScreenView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 0, y: 248, width: 375, height: 564)
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        return element
    }()

    private lazy var cafeLogoImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 100, y: 75, width: 175, height: 76)
        element.image = UIImage(named: "cafeLogo")
        return element
    }()

    private lazy var authorizationLabel: UILabel = {
        let element = UILabel()
        element.text = "Авторизация"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-Bold", size: 26)
        element.frame = CGRect(x: 20, y: 32, width: 195, height: 31)
        return element
    }()

    private lazy var loginLabel: UILabel = {
        let element = UILabel()
        element.text = "Логин"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 84, width: 175, height: 19)
        return element
    }()

    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.text = "Пароль"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 159, width: 175, height: 19)
        return element
    }()

    private lazy var hidenEyeButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(named: "vector"), for: .normal)
        element.frame = CGRect(x: 332, y: 185, width: 22, height: 19)
        element.addTarget(self, action: #selector(hideButtonPressed), for: .touchUpInside)
        return element
    }()

    private lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Введите пароль"
        element.isSecureTextEntry = true
        element.font = UIFont(name: "Verdana", size: 14)
        element.frame = CGRect(x: 20, y: 188, width: 129, height: 17)
        return element
    }()

    private lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Введите почту"
        element.font = UIFont(name: "Verdana", size: 14)
        element.frame = CGRect(x: 20, y: 113, width: 175, height: 17)
        return element
    }()

    private lazy var loginButton: UIButton = {
        let element = UIButton(type: .system)
        element.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        element.setTitleColor(.white, for: .normal)
        element.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        element.setTitle("Войти", for: .normal)
        element.backgroundColor = UIColor(named: "buttonBlue")
        element.layer.cornerRadius = 12
        element.isEnabled = false
        element.alpha = 0.5
        element.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return element
    }()

    private lazy var emailGreyLineView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 138, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var passwordGreyLineView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 214, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .brownBase
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(whitePartOfScreenView)
        view.addSubview(cafeLogoImageView)
        whitePartOfScreenView.addSubview(authorizationLabel)
        whitePartOfScreenView.addSubview(loginLabel)
        whitePartOfScreenView.addSubview(passwordLabel)
        whitePartOfScreenView.addSubview(hidenEyeButton)
        whitePartOfScreenView.addSubview(passwordTextField)
        whitePartOfScreenView.addSubview(emailTextField)
        whitePartOfScreenView.addSubview(loginButton)
        whitePartOfScreenView.addSubview(emailGreyLineView)
        whitePartOfScreenView.addSubview(passwordGreyLineView)
    }

    @objc private func hideButtonPressed() {
        if hidenEyeButton.currentImage == UIImage(named: "vector") {
            hidenEyeButton.setImage(UIImage(named: "vectorOpen"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            hidenEyeButton.setImage(UIImage(named: "vector"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }

    @objc private func loginButtonPressed() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true, completion: nil)
    }
}

// MARK: - Extension UITextFieldDelegate
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
