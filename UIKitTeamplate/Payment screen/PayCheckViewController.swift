// PayCheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отображающий чек заказа и оплату
final class PayCheckViewController: UIViewController {
    // MARK: - Visual Components

    // Кнопка закрытие экрана
    private let closeButton = UIButton()

    // Картинки узоров
    private let leftImageView = UIImageView()
    private let rightImageView = UIImageView()
    private let centerImageView = UIImageView()

    // Кнопка оплатить
    private let payButton = UIButton()

    // Лейблы с названием экрана и суммой заказа
    private let titleLabel = UILabel()
    private let sumLabel = UILabel()

    // Лейблы с названием продуктов
    private let americanoLabel = UILabel()
    private let milkLabel = UILabel()
    private let espressoLabel = UILabel()

    // Лейблы с ценами продуктов
    private let firstPriceLabel = UILabel()
    private let secondPriceLabel = UILabel()
    private let thirdPriceLabel = UILabel()

    // MARK: - СallBacks

    // Сlosure для показа экрана "Спасибо за заказ"
    var pushThanks: (() -> ())?

    // MARK: - Initializers

    init(pushThanks: (() -> ())?) {
        self.pushThanks = pushThanks
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
        configCloseButton()
        setupTracery()
        configCenterTracery()
        configPayButton()
        setupPriceLabel()
        setupNameLabel()
        setupTitleLabel()
        setupSumLabel()
    }

    // MARK: - Private Methods

    // Метод настройки вью
    private func configView() {
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 66, width: 375, height: 746)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // Метод настройки кнопки "закрыть"
    private func configCloseButton() {
        view.addSubview(closeButton)
        closeButton.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(selfDismiss), for: .touchUpInside)
    }

    // Общий метод настройки картинок с узорами
    private func configTracery(nameView: UIImageView, nameImage: String, left: CGFloat) {
        view.addSubview(nameView)
        nameView.frame = CGRect(x: left, y: 47, width: 100, height: 73)
        nameView.image = UIImage(named: nameImage)
    }

    // Метод задает параметры для картинок с узорами
    private func setupTracery() {
        configTracery(
            nameView: leftImageView,
            nameImage: "ileftImage",
            left: 20
        )
        configTracery(
            nameView: rightImageView,
            nameImage: "irightImage",
            left: 260
        )
    }

    // Метод настройки центральной картинки с узором
    private func configCenterTracery() {
        view.addSubview(centerImageView)
        centerImageView.frame = CGRect(x: 145, y: 420, width: 100, height: 40)
        centerImageView.image = UIImage(named: "image center")
    }

    // Метод настройки кнопки оплатить
    private func configPayButton() {
        view.addSubview(payButton)
        payButton.frame = CGRect(x: 15, y: 570, width: 345, height: 53)
        payButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.7450980392, blue: 0.7803921569, alpha: 1)
        payButton.setTitle("Оплатить", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        payButton.layer.cornerRadius = 12

        payButton.addTarget(self, action: #selector(showThanks), for: .touchUpInside)
    }

    // Общий метод настройки цен продуктов
    private func configPriceItems(nameLabel: UILabel, price: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 225, y: top, width: 130, height: 30)
        nameLabel.text = price
        nameLabel.textAlignment = .right
        nameLabel.font = UIFont.systemFont(ofSize: 16)
    }

    // Метод задает параметры ценам продуктов
    private func setupPriceLabel() {
        configPriceItems(nameLabel: firstPriceLabel, price: "100 руб", top: 155)
        configPriceItems(nameLabel: secondPriceLabel, price: "50 руб", top: 191)
        configPriceItems(nameLabel: thirdPriceLabel, price: "50 руб", top: 227)
        firstPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    // Общий метод настройки наименований продуктов
    private func configFoodLabel(nameLabel: UILabel, name: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: top, width: 150, height: 30)
        nameLabel.text = name
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 16)
    }

    // Метод задает параметры наименованиям продуктов
    private func setupNameLabel() {
        configFoodLabel(nameLabel: americanoLabel, name: "Американо", top: 155)
        configFoodLabel(nameLabel: milkLabel, name: "Молоко", top: 191)
        configFoodLabel(nameLabel: espressoLabel, name: "Эспрессо", top: 227)
        americanoLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    // Метод настройки названия экрана
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
        titleLabel.text = "Вашъ Заказъ"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    // Метод настроойки суммы
    private func setupSumLabel() {
        view.addSubview(sumLabel)
        sumLabel.frame = CGRect(x: 80, y: 371, width: 231, height: 30)
        sumLabel.text = "Цѣна - 200 руб"
        sumLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        sumLabel.textAlignment = .center
    }

    // Метод закрывает экран и передает кложуру для перехода на экран "Спасибо за заказ".
    // При нажатии на кнопку "оплатить"
    @objc private func showThanks() {
        dismiss(animated: true)
        pushThanks?()
    }

    // Метод закрытия экрана при нажатии на крестик
    @objc private func selfDismiss() {
        dismiss(animated: true)
    }
}
