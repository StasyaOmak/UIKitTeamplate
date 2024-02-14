// AddIngredientViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс добавления дополнительных ингредиентов
final class AddIngredientViewController: UIViewController {
    // MARK: - Visual Components

    // Название экрана и кнопка закрыть
    private let titleLabel = UILabel()
    private let closeButton = UIButton()

    // Свитчи  для добавления продуктов
    private let milkSwitch = UISwitch()
    private let syropSwitch = UISwitch()
    private let soyMilkSwitch = UISwitch()
    private let almondMilkSwitch = UISwitch()
    private let espressoSwitch = UISwitch()

    // Наименование ингридиентов
    private let milkLabel = UILabel()
    private let syrupLabel = UILabel()
    private let soyMilkLabel = UILabel()
    private let almondMilkLabel = UILabel()
    private let espressoLabel = UILabel()

    // MARK: - Private Properties
    
    // Значение добавлены ли ингредиенты
    private var isAdded = false

    // Сlosure принимает параметр выбрано ли что-то из доп. ингредиентов
    private var productsIsAdded: ((Bool) -> Void)?

    // MARK: - Initializers

    init(productsIsAdded: ((Bool) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        self.productsIsAdded = productsIsAdded
    }

    required init?(coder: NSCoder) {
        nil
    }

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
        configTitle()
        configCloseButton()
        setupSwitch()
        setupFood()
    }

    // MARK: - Private Methods

    // Метод настройки вью
    private func configView() {
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 62, width: 375, height: 750)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    // Метод настройки названия экрана
    private func configTitle() {
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        titleLabel.text = "Выберите дополнительные \n ингредіенты"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 2
    }

    // Метод настройки кнопки закрыть
    private func configCloseButton() {
        view.addSubview(closeButton)
        closeButton.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(selfDismiss), for: .touchUpInside)
    }

    // Общий метод настройки свитчей
    private func configSwitch(nameSWich: UISwitch, top: CGFloat) {
        view.addSubview(nameSWich)
        nameSWich.frame = CGRect(x: 302, y: top, width: 31, height: 31)
        nameSWich.isOn = false
    }

    // Метод проверяет активен ли хотя бы один из свитчей(выбран ли ингридиент)
    private func checkIsAdded() {
        guard
            !milkSwitch.isOn,
            !syropSwitch.isOn,
            !soyMilkSwitch.isOn,
            !almondMilkSwitch.isOn,
            !espressoSwitch.isOn
        else {
            isAdded = true
            return
        }
        isAdded = false
    }

    // Метод задает параметры свитчам
    private func setupSwitch() {
        configSwitch(nameSWich: milkSwitch, top: 124)
        configSwitch(nameSWich: syropSwitch, top: 176)
        configSwitch(nameSWich: soyMilkSwitch, top: 226)
        configSwitch(nameSWich: almondMilkSwitch, top: 276)
        configSwitch(nameSWich: espressoSwitch, top: 326)
    }

    // Общий метод настройки наименований продуктов
    private func configNameFood(nameLabel: UILabel, top: CGFloat, text: String, price: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: top, width: 275, height: 35)

        // Задаем тексту цены зеленый цвет
        let price = NSAttributedString(
            string: price,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        )

        // Весь текст: наименование - цена
        let allText = NSMutableAttributedString(string: text)
        allText.append(price)

        nameLabel.attributedText = allText
    }

    // Метод задает параметры продуктам
    private func setupFood() {
        configNameFood(
            nameLabel: milkLabel,
            top: 124,
            text: "Молоко",
            price: " +50"
        )
        configNameFood(
            nameLabel: syrupLabel,
            top: 174,
            text: "Сироп",
            price: " +20"
        )
        configNameFood(
            nameLabel: soyMilkLabel,
            top: 224,
            text: "Молоко соевое",
            price: " +50"
        )

        configNameFood(
            nameLabel: almondMilkLabel,
            top: 274,
            text: "Молоко миндальное",
            price: " +70"
        )
        configNameFood(
            nameLabel: espressoLabel,
            top: 324,
            text: "Эспрессо",
            price: " +50"
        )
    }

    // Метод закрывает экран и передает на экран заказа значение выбраны ли ингридиенты
    @objc private func selfDismiss() {
        checkIsAdded()
        productsIsAdded?(isAdded)
        dismiss(animated: true)
    }
}
