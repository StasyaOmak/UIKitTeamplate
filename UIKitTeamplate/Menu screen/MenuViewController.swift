// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MenuViewController: UIViewController {
    private lazy var cafeLogoImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 100, y: 49, width: 175, height: 76)
        element.image = UIImage(named: "cafeLogo")
        return element
    }()

    private lazy var whitePartOfScreen: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 0, y: 248, width: 375, height: 564)
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        return element
    }()

    private lazy var customerButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .buttonBlue
        element.layer.cornerRadius = 22
        element.setTitle("L", for: .normal)
        element.tintColor = .white
        element.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        return element
    }()

    private lazy var helloLabel: UILabel = {
        let element = UILabel()
        element.text = "Добро пожаловать,\nГость"
        element.textColor = .white
        element.numberOfLines = 2
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 20, y: 147, width: 158, height: 44)
        return element
    }()

    private lazy var menuImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 125, y: 122, width: 125, height: 80)
        element.image = UIImage(named: "menu")
        return element
    }()

    private lazy var pieButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 216, width: 335, height: 80)
        return element
    }()

    private lazy var pieImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        element.image = UIImage(named: "pie")
        return element
    }()

    private lazy var pieoLabel: UILabel = {
        let element = UILabel()
        element.text = "Пти пате аля «РюсЪ»"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 25, y: 30.5, width: 220, height: 19)
        return element
    }()

    private lazy var coffeeButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 316, width: 335, height: 80)
        return element
    }()

    private lazy var coffeeImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 20, width: 70, height: 44.66)
        element.image = UIImage(named: "cupOfCoffee")
        return element
    }()

    private lazy var coffeeLabel: UILabel = {
        let element = UILabel()
        element.text = "Горячiя напитки"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 25, y: 30, width: 180, height: 19)
        return element
    }()

    private lazy var cupWithGrainsButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBrown
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 416, width: 335, height: 80)
        element.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        return element
    }()

    private lazy var cupWithGrainsImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        element.image = UIImage(named: "cupWithGrains")
        return element
    }()

    private lazy var cupWithGrainsLabel: UILabel = {
        let element = UILabel()
        element.text = "Кофий"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 25, y: 30.5, width: 180, height: 19)
        return element
    }()

    private lazy var locationButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .lightBlueAdress
        element.layer.cornerRadius = 16
        element.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        return element
    }()

    private lazy var adressOfCaffeeLabel: UILabel = {
        let element = UILabel()
        element.text = "Адреса кофеен"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        return element
    }()

    private lazy var infoAdressLabel: UILabel = {
        let element = UILabel()
        element.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        element.textColor = .gray
        element.numberOfLines = 2
        element.font = .systemFont(ofSize: 12, weight: .light)
        element.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        return element
    }()

    private lazy var locationImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 289.29, y: 19.92, width: 20.43, height: 29.17)
        element.image = UIImage(named: "locationPoint")
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .brownBase
    }

    private func setupViews() {
        view.addSubview(cafeLogoImageView)
        view.addSubview(whitePartOfScreen)
        view.addSubview(customerButton)
        view.addSubview(helloLabel)
        whitePartOfScreen.addSubview(menuImageView)
        whitePartOfScreen.addSubview(pieButton)
        pieButton.addSubview(pieImageView)
        pieButton.addSubview(pieoLabel)
        whitePartOfScreen.addSubview(coffeeButton)
        coffeeButton.addSubview(coffeeImageView)
        coffeeButton.addSubview(coffeeLabel)
        whitePartOfScreen.addSubview(cupWithGrainsButton)
        cupWithGrainsButton.addSubview(cupWithGrainsImageView)
        cupWithGrainsButton.addSubview(cupWithGrainsLabel)
        whitePartOfScreen.addSubview(locationButton)
        locationButton.addSubview(adressOfCaffeeLabel)
        locationButton.addSubview(infoAdressLabel)
        locationButton.addSubview(locationImageView)
    }

    @objc private func okButtonPressed() {
        let menuViewController = ThanksScreenViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true, completion: nil)
    }
}
