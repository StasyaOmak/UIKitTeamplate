// PayCheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображающий чек заказа и оплату
final class PayCheckViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "Вашъ Заказъ"
        static let payText = "Оплатить"
        static let hundredPrice = "100 руб"
        static let fiftyPrice = "50 руб"
        static let americano = "Американо"
        static let milk = "Молоко"
        static let espresso = "Эспрессо"
        static let sumText = "Цѣна - 200 руб"

        static let close = "close"
        static let leftImage = "ileftImage"
        static let rightImage = "irightImage"
        static let centerImage = "image center"
    }

    // MARK: - Visual Components

    private let closeButton = UIButton()

    private let leftImageView = UIImageView()
    private let rightImageView = UIImageView()
    private let centerImageView = UIImageView()

    private let payButton = UIButton()

    private let titleLabel = UILabel()
    private let sumLabel = UILabel()

    private let americanoLabel = UILabel()
    private let milkLabel = UILabel()
    private let espressoLabel = UILabel()

    private let firstPriceLabel = UILabel()
    private let secondPriceLabel = UILabel()
    private let thirdPriceLabel = UILabel()

    // Сlosure для показа экрана "Спасибо за заказ"
    var pushThanksHandler: (() -> ())?

    // MARK: - Initializers

    init(pushThanks: (() -> ())?) {
        pushThanksHandler = pushThanks
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

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

    private func configView() {
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 66, width: 375, height: 746)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private func configCloseButton() {
        view.addSubview(closeButton)
        closeButton.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        closeButton.setImage(UIImage(named: Constants.close), for: .normal)
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    private func configTracery(nameView: UIImageView, nameImage: String, left: CGFloat) {
        view.addSubview(nameView)
        nameView.frame = CGRect(x: left, y: 47, width: 100, height: 73)
        nameView.image = UIImage(named: nameImage)
    }

    private func setupTracery() {
        configTracery(
            nameView: leftImageView,
            nameImage: Constants.leftImage,
            left: 20
        )
        configTracery(
            nameView: rightImageView,
            nameImage: Constants.rightImage,
            left: 260
        )
    }

    private func configCenterTracery() {
        view.addSubview(centerImageView)
        centerImageView.frame = CGRect(x: 145, y: 420, width: 100, height: 40)
        centerImageView.image = UIImage(named: Constants.centerImage)
    }

    private func configPayButton() {
        view.addSubview(payButton)
        payButton.frame = CGRect(x: 15, y: 570, width: 345, height: 53)
        payButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.7450980392, blue: 0.7803921569, alpha: 1)
        payButton.setTitle(Constants.payText, for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        payButton.layer.cornerRadius = 12
        payButton.addTarget(self, action: #selector(showThanks), for: .touchUpInside)
    }

    private func configPriceItems(nameLabel: UILabel, price: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 225, y: top, width: 130, height: 30)
        nameLabel.text = price
        nameLabel.textAlignment = .right
        nameLabel.font = UIFont.systemFont(ofSize: 16)
    }

    private func setupPriceLabel() {
        configPriceItems(nameLabel: firstPriceLabel, price: Constants.hundredPrice, top: 155)
        configPriceItems(nameLabel: secondPriceLabel, price: Constants.fiftyPrice, top: 191)
        configPriceItems(nameLabel: thirdPriceLabel, price: Constants.fiftyPrice, top: 227)
        firstPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    private func configFoodLabel(nameLabel: UILabel, name: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: top, width: 150, height: 30)
        nameLabel.text = name
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 16)
    }

    private func setupNameLabel() {
        configFoodLabel(nameLabel: americanoLabel, name: Constants.americano, top: 155)
        configFoodLabel(nameLabel: milkLabel, name: Constants.milk, top: 191)
        configFoodLabel(nameLabel: espressoLabel, name: Constants.espresso, top: 227)
        americanoLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
        titleLabel.text = Constants.titleText
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private func setupSumLabel() {
        view.addSubview(sumLabel)
        sumLabel.frame = CGRect(x: 80, y: 371, width: 231, height: 30)
        sumLabel.text = Constants.sumText
        sumLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        sumLabel.textAlignment = .center
    }

    // Метод закрывает экран и передает кложуру для перехода на экран "Спасибо за заказ".
    // При нажатии на кнопку "оплатить"
    @objc private func showThanks() {
        dismiss(animated: true)
        pushThanksHandler?()
    }

    @objc private func dismissView() {
        dismiss(animated: true)
    }
}
