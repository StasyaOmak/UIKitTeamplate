// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отвечает за отображение главного меню приложения.
final class MenuViewController: UIViewController {
    // MARK: - Private Properties

    // Cвойство для создания логотипа кафе
    private lazy var cafeLogoImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 100, y: 49, width: 175, height: 76)
        element.image = UIImage(named: "cafeLogo")
        return element
    }()

    // Cвойство для создания белой view
    private lazy var whitePartOfScreenView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 0, y: 248, width: 375, height: 564)
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        return element
    }()

    // Cвойство для создания логотипа для клиена
    private lazy var customerButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .buttonBlue
        element.layer.cornerRadius = 22
        element.setTitle("L", for: .normal)
        element.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        element.tintColor = .white
        element.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        return element
    }()

    // Свойство для создания приветственного сообщения
    private lazy var helloLabel: UILabel = {
        let element = UILabel()
        element.text = "Добро пожаловать,\nГость"
        element.textColor = .lightBrown
        element.numberOfLines = 2
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        return element
    }()

    // Свойство для создания изображения меню
    private lazy var menuImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 125, y: 122, width: 125, height: 80)
        element.image = UIImage(named: "menu")
        return element
    }()

    // Кнопка для выбора пирога
    private lazy var pieButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 216, width: 335, height: 80)
        return element
    }()

    // Изображение пирога
    private lazy var pieImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        element.image = UIImage(named: "pie")
        return element
    }()

    // Лейбл для пирога
    private lazy var pieoLabel: UILabel = {
        let element = UILabel()
        element.text = "Пти пате аля «РюсЪ»"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        element.frame = CGRect(x: 25, y: 30.5, width: 220, height: 19)
        return element
    }()

    // Кнопка для выбора горячих напитков
    private lazy var hotDrinksButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 316, width: 335, height: 80)
        return element
    }()

    // Изображение кружки с кофе
    private lazy var hotDrinksImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 20, width: 70, height: 44.66)
        element.image = UIImage(named: "cupOfCoffee")
        return element
    }()

    // Лейбл для горячих напитков
    private lazy var hotDrinksLabel: UILabel = {
        let element = UILabel()
        element.text = "Горячiя напитки"
        element.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        element.textColor = .black
        element.frame = CGRect(x: 25, y: 30, width: 180, height: 19)
        return element
    }()

    // Кнопка для выбора кофе
    private lazy var cupWithGrainsButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 416, width: 335, height: 80)
        element.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        return element
    }()

    // Изображение чашки с зёрнами
    private lazy var cupWithGrainsImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        element.image = UIImage(named: "cupWithGrains")
        return element
    }()

    // Лейбл для кофе
    private lazy var cupWithGrainsLabel: UILabel = {
        let element = UILabel()
        element.text = "Кофий"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        element.frame = CGRect(x: 25, y: 30.5, width: 180, height: 19)
        return element
    }()

    // Кнопка для местоположения
    private lazy var locationButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBlueAdress
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        return element
    }()

    // Адреса кофеен
    private lazy var adressOfCaffeeLabel: UILabel = {
        let element = UILabel()
        element.text = "Адреса кофеен"
        element.textColor = .black
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        return element
    }()

    // Текст разрешения для использования геолокации
    private lazy var infoAdressLabel: UILabel = {
        let element = UILabel()
        element.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        element.textColor = .gray
        element.numberOfLines = 2
        element.font = UIFont(name: "Verdana", size: 12)
        element.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        return element
    }()

    // Картинка геолокации
    private lazy var locationImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 289.29, y: 19.92, width: 20.43, height: 29.17)
        element.image = UIImage(named: "locationPoint")
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .brownBase
    }

    // MARK: - Private Methods

    // Добавление вью на экран
    private func setupViews() {
        view.addSubview(cafeLogoImageView)
        view.addSubview(whitePartOfScreenView)
        view.addSubview(customerButton)
        view.addSubview(helloLabel)
        whitePartOfScreenView.addSubview(menuImageView)
        whitePartOfScreenView.addSubview(pieButton)
        pieButton.addSubview(pieImageView)
        pieButton.addSubview(pieoLabel)
        whitePartOfScreenView.addSubview(hotDrinksButton)
        hotDrinksButton.addSubview(hotDrinksImageView)
        hotDrinksButton.addSubview(hotDrinksLabel)
        whitePartOfScreenView.addSubview(cupWithGrainsButton)
        cupWithGrainsButton.addSubview(cupWithGrainsImageView)
        cupWithGrainsButton.addSubview(cupWithGrainsLabel)
        whitePartOfScreenView.addSubview(locationButton)
        locationButton.addSubview(adressOfCaffeeLabel)
        locationButton.addSubview(infoAdressLabel)
        locationButton.addSubview(locationImageView)
    }

    // Метод для перехода на экран с Кофе
    @objc private func menuButtonPressed() {
        let menuViewController = OrderCofeeViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true, completion: nil)
    }
}
