// OrderCofeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран заказа кофе
final class OrderCofeeViewController: UIViewController {
    // MARK: - Constants
    
    private enum Constants {
        static let promocodeText  = "Лови промокод roadmaplove на любой напиток из Кофейнов"
        static let roastingTitle = "Темная  \n обжарка"
        static let addProductsTitle = "Дополнительные \n ингредиенты"
        static let modificationTitle = "Модификация"
        static let priceText = "Цѣна - 100 руб"
        static let buttonTitle = "Заказть"
        
        static let americano = "Американо"
        static let cappuccino = "Капучино"
        static let latte = "Латте"
        static let chekMark = "СheckMark"
        static let roasting = "Зерна"
        static let plus = "Плюс"
        static let navigation = "Стрелка 2"
        static let share = "telegram"
    }

    // MARK: - Visual Components

    private let topView = UIView()
    private let cofeeImageView = UIImageView()
    private let cofeeImages = [
        UIImage(named: Constants.americano),
        UIImage(named: Constants.cappuccino),
        UIImage(named: Constants.latte)
    ]

    
    private let roastingButton = UIButton()
    private let plusButton = UIButton()
    private let forRoastingLabel = UILabel()
    private let forPlusLabel = UILabel()

    private let priceLabel = UILabel()
    private let orderButton = UIButton()
    private let modificationLabel = UILabel()

    
    private let leftButton = UIButton()
    private let rightButton = UIButton()

    
    private let cofeeNames = [Constants.americano, Constants.cappuccino, Constants.latte]

    // MARK: - Private Properties

    private var cofeeSegmentedControl = UISegmentedControl()

    // closure принимает параметр выбрано ли что-то из доп. ингредиентов
    private var productsIsAddedHandler: ((Bool) -> Void)?

    // closure вызывается при нажатии на "Оплатить"( в PayCheck) переход на эран "Thanks"
    private var pushThanksHandler: (() -> ())?

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
        configTopView()
        configImageViewCofee()
        configSegmented()
        setupButton()
        setupTitle()
        configModification()
        configPrice()
        configButtonOrder()
        configNavigation()
        configureProductsIsAdded()
        configShare()
        configPush()
    }

    // MARK: - Private Methods

    private func configView() {
        view.backgroundColor = .white
    }
    
    // Метод задает значение кложуре для перехода на экран "Спасибо за покупку"
    private func configPush() {
        pushThanksHandler = { [ weak self ] in
            guard let self = self else { return }
            let thanksVC = ThanksScreenViewController()
            thanksVC.view.backgroundColor = .white
            self.navigationController?.pushViewController(thanksVC, animated: true)
        }
    }

    // Метод задает значение кложуре чтобы отобразить галочку в кнопке если добавлен хоть один из ингридиентов
    private func configureProductsIsAdded() {
        productsIsAddedHandler = { [ weak self ] isAdded in
            guard
                let self = self,
                isAdded
            else { return }
            self.plusButton.setImage(UIImage(named: Constants.chekMark), for: .normal)
        }
    }

    private func configTopView() {
        view.addSubview(topView)
        topView.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.831372549, blue: 0.737254902, alpha: 1)
    }

    private func configImageViewCofee() {
        cofeeImageView.image = UIImage(named: Constants.buttonTitle)
        topView.addSubview(cofeeImageView)
        cofeeImageView.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
    }

    private func configSegmented() {
        cofeeSegmentedControl = UISegmentedControl(items: cofeeNames)
        cofeeSegmentedControl.frame = CGRect(x: 5, y: 368, width: 345, height: 44)
        cofeeSegmentedControl.addTarget(self, action: #selector(selectImage), for: .valueChanged)
        view.addSubview(cofeeSegmentedControl)
    }

    private func configButton(nameButton: UIButton, left: CGFloat, image: String) {
        view.addSubview(nameButton)
        nameButton.frame = CGRect(x: left, y: 482, width: 165, height: 165)
        nameButton.setTitle(title, for: .normal)
        nameButton.setImage(UIImage(named: image), for: .normal)
        nameButton.layer.cornerRadius = 12
        nameButton.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }

    private func setupButton() {
        configButton(nameButton: roastingButton, left: 15, image: Constants.roasting)
        configButton(nameButton: plusButton, left: 195, image: Constants.plus)

        plusButton.addTarget(
            self,
            action: #selector(showAddIngridients),
            for: .touchUpInside
        )

        roastingButton.addTarget(
            self,
            action: #selector(presentChooseCofeeViewController),
            for: .touchUpInside
        )
    }

    private func configTitle(nameLabel: UILabel, left: CGFloat, title: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: left, y: 599, width: 165, height: 34)
        nameLabel.text = title
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(14)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
    }

    private func setupTitle() {
        configTitle(nameLabel: forRoastingLabel, left: 15, title: Constants.roastingTitle)
        configTitle(nameLabel: forPlusLabel, left: 195, title: Constants.addProductsTitle)
    }

    private func configModification() {
        view.addSubview(modificationLabel)
        modificationLabel.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        modificationLabel.text = Constants.modificationTitle
        modificationLabel.textColor = .black
        modificationLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private func configPrice() {
        view.addSubview(priceLabel)
        priceLabel.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        priceLabel.text = Constants.priceText
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        priceLabel.textAlignment = .right
    }

    private func configButtonOrder() {
        view.addSubview(orderButton)
        orderButton.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        orderButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.7450980392, blue: 0.7803921569, alpha: 1)
        orderButton.setTitle(Constants.buttonTitle, for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        orderButton.layer.cornerRadius = 12

        orderButton.addTarget(self, action: #selector(showPayCheckViewController), for: .touchUpInside)
    }

    private func configNavigation() {
        leftButton.setImage(UIImage(named: Constants.navigation), for: .normal)
        leftButton.backgroundColor = #colorLiteral(red: 0.9364200234, green: 0.9713943601, blue: 0.9751471877, alpha: 1)
        leftButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftButton.layer.cornerRadius = leftButton.frame.width / 2

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        leftButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }

    private func configShare() {
        rightButton.setImage(UIImage(named: Constants.share), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        rightButton.addTarget(self, action: #selector(shareCode), for: .touchUpInside)
    }

    // Метод отправки промокода через активити
    @objc private func shareCode(sender: UIButton) {
        let textToShare = [Constants.promocodeText]
        let activity = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }

    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func showPayCheckViewController() {
        let checkVC = PayCheckViewController(pushThanks: pushThanksHandler)
        navigationController?.present(checkVC, animated: true)
    }

    @objc private func presentChooseCofeeViewController() {
        let chooseVC = ChooseCofeeViewController()
        navigationController?.present(chooseVC, animated: true)
    }

    @objc private func showAddIngridients() {
        let addProductsVC = AddIngredientViewController(productsIsAdded: productsIsAddedHandler)
        navigationController?.present(addProductsVC, animated: true)
    }

    @objc private func selectImage(_ target: UISegmentedControl) {
        if target == cofeeSegmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            cofeeImageView.image = cofeeImages[segmentIndex]
        }
    }
}
