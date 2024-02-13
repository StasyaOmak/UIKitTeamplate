// OrderCofeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс заказа кофе
final class OrderCofeeViewController: UIViewController {
    
    // MARK: - Constants
    
    //Верхнее вью отображает картинку выбранного кофе
    private let topView = UIView()
    private let cofeeImageView = UIImageView()
    private let imagesCofee = [
        UIImage(named: "Американо"),
        UIImage(named: "Капучино"),
        UIImage(named: "Латте")
    ]

    //кнопки: выбор обжарки, добавление ингредиентов
    private let roastingButton = UIButton()
    private let plusButton = UIButton()
    private let labelForRoasting = UILabel()
    private let labelForPlus = UILabel()

    private let priceLabel = UILabel()
    private let orderButton = UIButton()
    private let modificationLabel = UILabel()

    //кнопки для навигейшен бара
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    
    //массив для SegmentedControl
    private let nameCofee = ["Американо", "Капучино", "Латте"]
    
    // MARK: - Private Properties

    private var cofeeSegment = UISegmentedControl()
    
    // closure принимает параметр выбрано ли что-то из доп. ингредиентов
    private var productsIsAdded: ((Bool) -> Void)?
    
    //closure вызывается при нажатии на "Оплатить"( в PayCheck) переход на эран "Thanks"
    private var pushThanks: (() -> ())?

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

    // MARK: - Visual Components

    // Кнопка для выбора степени обжарки (темная)
    private lazy var roastingButton: UIButton = {
        let element = UIButton()
        element.layer.cornerRadius = 16
        element.backgroundColor = .coffeeButton
        element.layer.cornerRadius = 12
        element.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        element.addTarget(self, action: #selector(roastingButtonTapped), for: .touchDown)
        return element
    }()

    // Изображение выбранной степени обжарки (темная)
    lazy var roastingImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 31, y: 17, width: 100, height: 100)
        element.image = .darkRoast
        return element
    }()

    // Текст выбранной степени обжарки (темная)
    lazy var roastingLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.roastingDark
        element.textColor = .black
        element.numberOfLines = 2
        element.font = UIFont(name: Constants.verdana, size: 13)
        element.frame = CGRect(x: 55, y: 117, width: 165, height: 34)
        return element
    }()
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTop()
        configImageCofee()
        configSegment()
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
    
    //Метод адает значение кложуре для перехода на экран "Спасибо за покупку"
    private func configPush() {
        pushThanks = {
            let thanksVC = ThanksScreenViewController()
            thanksVC.view.backgroundColor = .white
            self.navigationController?.pushViewController(thanksVC, animated: true)
        }
    }

    //Метод задает значение кложуре чтобы отобразить галочку в кнопке если добавлен хоть один из ингридиентов
    private func configureProductsIsAdded() {
        productsIsAdded = { isAdded in
            guard isAdded else { return }
            self.plusButton.setImage(UIImage(named: "СheckMark"), for: .normal)
        }
    }

    //Метод настройки верхней части вью
    private func configTop() {
        view.addSubview(topView)
        topView.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.831372549, blue: 0.737254902, alpha: 1)
    }

    //Метод настройки картинки с кофе в верхней части вью
    private func configImageCofee() {
        cofeeImageView.image = UIImage(named: "Американо")
        topView.addSubview(cofeeImageView)
        cofeeImageView.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
    }

    //Метод настройки SegmentedControl
    private func configSegment() {
        cofeeSegment = UISegmentedControl(items: nameCofee)
        cofeeSegment.frame = CGRect(x: 5, y: 368, width: 345, height: 44)
        cofeeSegment.addTarget(self, action: #selector(selectImage), for: .valueChanged)
        view.addSubview(cofeeSegment)
    }

    //Общий метод для настройки кнопок: выбор обжарки, добавление ингредиентов
    private func configButton(nameButton: UIButton, left: CGFloat, image: String) {
        view.addSubview(nameButton)
        nameButton.frame = CGRect(x: left, y: 482, width: 165, height: 165)
        nameButton.setTitle(title, for: .normal)
        nameButton.setImage(UIImage(named: image), for: .normal)
        nameButton.layer.cornerRadius = 12
        nameButton.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }

    //Метод задает параметры кнопкам: выбор обжарки, добавление ингредиентов
    private func setupButton() {
        configButton(nameButton: roastingButton, left: 15, image: "Зерна")
        configButton(nameButton: plusButton, left: 195, image: "Плюс")
        
        plusButton.addTarget(
            self,
            action: #selector(showAddIngridients),
            for: .touchUpInside
        )

        roastingButton.addTarget(
            self,
            action: #selector(presentChooseCofee),
            for: .touchUpInside
        )
    }

    //Общий метод настройки названий для кнопок: выбор обжарки, добавление ингредиентов
    private func configTitle(nameLabel: UILabel, left: CGFloat, title: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: left, y: 599, width: 165, height: 34)
        nameLabel.text = title
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(14)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
    }

    //Метод задает параметры для названия кнопок
    private func setupTitle() {
        configTitle(nameLabel: labelForRoasting, left: 15, title: "Темная  \n обжарка")
        configTitle(nameLabel: labelForPlus, left: 195, title: "Дополнительные \n ингредиенты")
    }

    //Метод настройки лейбла "Модификация"
    private func configModification() {
        view.addSubview(modificationLabel)
        modificationLabel.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        modificationLabel.text = "Модификация"
        modificationLabel.textColor = .black
        modificationLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    //Метод настройки лейбла цены
    private func configPrice() {
        view.addSubview(priceLabel)
        priceLabel.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        priceLabel.text = "Цѣна - 100 руб"
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        priceLabel.textAlignment = .right
    }

    //Метод настройки кнопки "Заказать"
    private func configButtonOrder() {
        view.addSubview(orderButton)
        orderButton.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        orderButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.7450980392, blue: 0.7803921569, alpha: 1)
        orderButton.setTitle("Заказть", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        orderButton.layer.cornerRadius = 12

        orderButton.addTarget(self, action: #selector(showCheck), for: .touchUpInside)
    }

    //Метод настройки стрелки на навигейшен баре
    private func configNavigation() {
        leftButton.setImage(UIImage(named: "Стрелка 2"), for: .normal)
        leftButton.backgroundColor = #colorLiteral(red: 0.9364200234, green: 0.9713943601, blue: 0.9751471877, alpha: 1)
        leftButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftButton.layer.cornerRadius = leftButton.frame.width / 2

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        leftButton.addTarget(self, action: #selector(selfPop), for: .touchUpInside)
    }

    //Метод настройки кнопки Share
    private func configShare() {
        rightButton.setImage(UIImage(named: "telegram"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        rightButton.addTarget(self, action: #selector(shareCode), for: .touchUpInside)
    }

    //Метод отправки промокода через активити
    @objc private func shareCode(sender: UIButton) {
        let text = "Лови промокод roadmaplove на любой напиток из Кофейнов"
        let textToShare = [text]
        let activity = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }
    
    //Метод для возврата на предыдуший экран при нажатии на стрелку
    @objc private func selfPop() {
        navigationController?.popViewController(animated: true)
    }
    
    //Метод перехода на экран чека с заказом при нажатии на кнопку "Заказать"
    @objc private func showCheck() {
        let checkVC = PayCheckViewController(pushThanks: pushThanks)
        navigationController?.present(checkVC, animated: true)
    }
    
    //Метод для перехода на экран выбор обжарки при нажати на кнопку обжарки
    @objc private func presentChooseCofee() {
        let chooseVC = ChooseCofeeViewController()
        navigationController?.present(chooseVC, animated: true)
    }

    //Метод для мерехода на экран выбор ингридиентов при нажатии на кнопку плюс
    @objc private func showAddIngridients() {
        let addProductsVC = AddIngredientViewController(productsIsAdded: productsIsAdded)
        navigationController?.present(addProductsVC, animated: true)
    }
    
    //Метод настройки картинки при выборе из сегмента определенного кофе
    @objc private func selectImage(_ target: UISegmentedControl) {
        if target == cofeeSegment {
            let segmentIndex = target.selectedSegmentIndex
            cofeeImageView.image = imagesCofee[segmentIndex]
        }
        setupViews()
    // MARK: - Private Methods

    // Добавление вью на экран
    private func setupViews() {
        roastingButton.addSubview(roastingImageView)
        view.addSubview(roastingButton)
        roastingButton.addSubview(roastingLabel)

        view.backgroundColor = .white
    }

    // Обработка нажатия кнопки выбора степени обжарки
    @objc private func loginButtonPressed() {
        coffeeRoast.delegate = self
        let coffeeRoast = ChoiceOfCoffeeRoast()
        // Выделение по дефолту кнопки на экране ChoiceOfCoffeeRoast
        if roastingLabel.text == AppConstants.roastingDark {
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
