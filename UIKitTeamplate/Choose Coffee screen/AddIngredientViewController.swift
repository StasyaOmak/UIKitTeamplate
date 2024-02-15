// AddIngredientViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран добавления дополнительных ингредиентов
final class AddIngredientViewController: UIViewController {
    // MARK: - Constants
    
    private enum Constants {
        static let titleText = "Выберите дополнительные \n ингредіенты"
        static let milk = "Молоко"
        static let syrop = "Сироп"
        static let soyMilk = "Молоко соевое"
        static let almondMilk = "Молоко миндальное"
        static let espresso = "Эспрессо"
        static let twenty = " +20"
        static let seventy = " +70"
        static let fifty = " +50"
        static let close = "close"
    }

    // MARK: - Visual Components
    
    private let titleLabel = UILabel()
    private let closeButton = UIButton()

    private let milkSwitch = UISwitch()
    private let syropSwitch = UISwitch()
    private let soyMilkSwitch = UISwitch()
    private let almondMilkSwitch = UISwitch()
    private let espressoSwitch = UISwitch()

    private let milkLabel = UILabel()
    private let syrupLabel = UILabel()
    private let soyMilkLabel = UILabel()
    private let almondMilkLabel = UILabel()
    private let espressoLabel = UILabel()

    // MARK: - Private Properties
    
    private var isAdded = false

    // Сlosure принимает параметр выбрано ли что-то из доп. ингредиентов
    private var productsIsAddedHandler: ((Bool) -> Void)?

    // MARK: - Initializers

    init(productsIsAdded: ((Bool) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        self.productsIsAddedHandler = productsIsAdded
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

    private func configView() {
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 62, width: 375, height: 750)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    private func configTitle() {
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        titleLabel.text = Constants.titleText
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 2
    }

    private func configCloseButton() {
        view.addSubview(closeButton)
        closeButton.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        closeButton.setImage(UIImage(named: Constants.close), for: .normal)
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    private func configSwitch(nameSWich: UISwitch, top: CGFloat) {
        view.addSubview(nameSWich)
        nameSWich.frame = CGRect(x: 302, y: top, width: 31, height: 31)
        nameSWich.isOn = false
    }

    // Метод проверяет добавлен ли хотя бы один ингридиент
    private func checkingAddedItems() {
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

    private func setupSwitch() {
        configSwitch(nameSWich: milkSwitch, top: 124)
        configSwitch(nameSWich: syropSwitch, top: 176)
        configSwitch(nameSWich: soyMilkSwitch, top: 226)
        configSwitch(nameSWich: almondMilkSwitch, top: 276)
        configSwitch(nameSWich: espressoSwitch, top: 326)
    }

    private func configNameFood(nameLabel: UILabel, top: CGFloat, text: String, price: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: top, width: 275, height: 35)

        let price = NSAttributedString(
            string: price,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        )

        let allText = NSMutableAttributedString(string: text)
        allText.append(price)

        nameLabel.attributedText = allText
    }

    private func setupFood() {
        configNameFood(
            nameLabel: milkLabel,
            top: 124,
            text: Constants.milk,
            price: Constants.fifty
        )
        configNameFood(
            nameLabel: syrupLabel,
            top: 174,
            text: Constants.syrop,
            price: Constants.twenty
        )
        configNameFood(
            nameLabel: soyMilkLabel,
            top: 224,
            text: Constants.soyMilk,
            price: Constants.fifty
        )

        configNameFood(
            nameLabel: almondMilkLabel,
            top: 274,
            text: Constants.almondMilk,
            price: Constants.seventy
        )
        configNameFood(
            nameLabel: espressoLabel,
            top: 324,
            text: Constants.espresso,
            price: Constants.fifty
        )
    }

    // Метод закрывает экран и передает на экран заказа значение выбраны ли ингридиенты
    @objc private func dismissView() {
        checkingAddedItems()
        productsIsAddedHandler?(isAdded)
        dismiss(animated: true)
    }
}
