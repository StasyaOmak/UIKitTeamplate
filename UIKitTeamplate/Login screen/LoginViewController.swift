// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации пользователя при входе в приложение
final class LoginViewController: UIViewController {
    // MARK: - Visual Components

    // Cвойство для создания белого View
    private lazy var whitePartOfScreenView: UIView = {
        let element = UIView()
        element.frame = Constants.whitePartViewRect
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        return element
    }()

    // Cвойство для создания логотипа кафе
    private lazy var cafeLogoImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 100, y: 75, width: 175, height: 76)
        element.image = .cafeLogo
        return element
    }()

    // Cвойство для создания лейбла авторизации
    private lazy var authorizationLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.authorizationText
        element.textColor = .black
        element.font = UIFont(name: Constants.verdanaBold, size: 26)
        element.frame = CGRect(x: 20, y: 32, width: 195, height: 31)
        return element
    }()

    // Cвойство для создания лейбла для логина
    private lazy var loginLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.loginText
        element.textColor = .black
        element.font = UIFont(name: Constants.verdanaBold, size: 16)
        element.frame = CGRect(x: 20, y: 84, width: 175, height: 19)
        return element
    }()

    // Cвойство для создания лейбла для пароля
    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.passwordText
        element.textColor = .black
        element.font = UIFont(name: Constants.verdanaBold, size: 16)
        element.frame = CGRect(x: 20, y: 159, width: 175, height: 19)
        return element
    }()

    // Кнопка для смены отобраения пароля
    private lazy var hidenEyeButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(named: Constants.vektorClose), for: .normal)
        element.frame = CGRect(x: 332, y: 185, width: 22, height: 19)
        element.addTarget(self, action: #selector(hideButtonPressed), for: .touchUpInside)
        return element
    }()

    // TextField для ввода пароля
    lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.placeholder = Constants.enterPasswordText
        element.isSecureTextEntry = true
        element.font = UIFont(name: Constants.verdana, size: 14)
        element.frame = CGRect(x: 20, y: 188, width: 129, height: 17)
        return element
    }()

    // TextField для ввода почты
    lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.placeholder = Constants.enterEmailText
        element.font = UIFont(name: Constants.verdana, size: 14)
        element.frame = CGRect(x: 20, y: 113, width: 175, height: 17)
        return element
    }()

    // Кнопка для открытия меню
    lazy var loginButton: UIButton = {
        let element = UIButton(type: .system)
        element.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 16)
        element.setTitleColor(.white, for: .normal)
        element.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        element.setTitle(Constants.enterButtonName, for: .normal)
        element.backgroundColor = .buttonBlue
        element.layer.cornerRadius = 12
        element.isEnabled = false
        element.alpha = 0.5
        element.addTarget(self, action: #selector(showMenuViewController), for: .touchUpInside)
        return element
    }()

    // View для разделения элементов
    private lazy var emailGreyLineView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 138, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    // View для разделения элементов
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
    }

    // MARK: - Private Methods

    // Добавление вью на экран
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

        view.backgroundColor = .brownBase

        // Установка делегатов
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // Метод для смены изображения отображающего пароль
    @objc private func hideButtonPressed() {
        if hidenEyeButton.currentImage == UIImage(named: Constants.vektorClose) {
            hidenEyeButton.setImage(UIImage(named: Constants.vectorOpen), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            hidenEyeButton.setImage(UIImage(named: Constants.vektorClose), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }

    // Метод отработки нажатия на кнопку
    @objc private func showMenuViewController() {
        let menuViewController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
