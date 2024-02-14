// OrderCofeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Протокол делегата выбора степени обжарки кофе
protocol CoffeeRoastSelectionDelegate: AnyObject {
    // Метод для передачи изображения выбранной степени обжарки
    func didSelectRoastingImage(_ image: UIImage)
    // Метод для передачи текста выбранной степени обжарки
    func didSelectRoastText(_ text: String)
}
/// Экран с выбором позиций кофе для заказа 
final class OrderCofeeViewController: UIViewController {
    var selectedRoastText: String?

    // MARK: - Private Properties

    // Кнопка для выбора степени обжарки (темная)
    private lazy var roastingButton: UIButton = {
        let element = UIButton()
        element.layer.cornerRadius = 16
        element.backgroundColor = .coffeeButton
        element.layer.cornerRadius = 12
        element.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        element.addTarget(self, action: #selector(loginButtonPressed), for: .touchDown)
        return element
    }()

    // Изображение выбранной степени обжарки (темная)
    private lazy var roastingImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 31, y: 17, width: 100, height: 100)
        element.image = UIImage(named: "darkRoast")
        return element
    }()

    // Текст выбранной степени обжарки (темная)
    private lazy var roastingLabel: UILabel = {
        let element = UILabel()
        element.text = "Темная\nобжарка"
        element.textColor = .black
        element.numberOfLines = 2
        element.font = UIFont(name: "Verdana", size: 13)
        element.frame = CGRect(x: 55, y: 117, width: 165, height: 34)
        return element
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    // Добавление вью на экран
    private func setupViews() {
        view.addSubview(roastingButton)
        roastingButton.addSubview(roastingImageView)
        roastingButton.addSubview(roastingLabel)
    }

    // Обработка нажатия кнопки выбора степени обжарки
    @objc private func loginButtonPressed() {
        let coffeeRoast = ChoiceOfCoffeeRoast()
        coffeeRoast.delegate = self
        // Выделение по дефолту кнопки на экране ChoiceOfCoffeeRoast
        if roastingLabel.text == "Темная\nобжарка" {
            coffeeRoast.roastingDarkButton.layer.borderWidth = 1
            coffeeRoast.roastingLightButton.layer.borderWidth = 0
        } else {
            coffeeRoast.roastingLightButton.layer.borderWidth = 1
            coffeeRoast.roastingDarkButton.layer.borderWidth = 0
        }
        coffeeRoast.modalPresentationStyle = .formSheet
        present(coffeeRoast, animated: true, completion: nil)
    }
}

// MARK: - Extension CoffeeRoastSelectionDelegate

extension OrderCofeeViewController: CoffeeRoastSelectionDelegate {
    // Установка изображения в зависимости от степени обжарки
    func didSelectRoastingImage(_ image: UIImage) {
        roastingImageView.image = image
    }

    // Установка текста в зависимости от степени обжарки
    func didSelectRoastText(_ text: String) {
        roastingLabel.text = text
    }
}
