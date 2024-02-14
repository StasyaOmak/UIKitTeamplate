// ThanksScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображает благодарность  после завершения заказа.
final class ThanksScreenViewController: UIViewController {
    // MARK: - Private Properties

    // Добавление картинки с цветами
    private lazy var flowerImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 92, y: 58, width: 200, height: 86.62)
        element.image = UIImage(named: "flowers")
        return element
    }()

    // Добавление картинки "Спасибо за заказ"
    private lazy var thanksImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        element.image = UIImage(named: "thanksForOrder")
        return element
    }()

    // Создание кнопки Хорошо
    private lazy var okButton: UIButton = {
        let element = UIButton(type: .system)
        element.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        element.setTitleColor(.white, for: .normal)
        element.frame = CGRect(x: 20, y: 632, width: 345, height: 53)
        element.setTitle("Хорошо", for: .normal)
        element.backgroundColor = UIColor(named: "buttonBlue")
        element.layer.cornerRadius = 12
        element.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        return element
    }()

    // Создание лейбла с промокодом
    private lazy var promoLabel: UILabel = {
        let element = UILabel()
        element.text = """
        Разскажи о насъ другу, отправь ему
        промокодъ
        ​ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
        """
        element.textColor = .gray
        element.numberOfLines = 4
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 16, weight: .light)
        element.frame = CGRect(x: 30, y: 362, width: 315, height: 89)
        return element
    }()

    // Создание лейбла для закрытия экрана
    private lazy var cancelLabel: UILabel = {
        let element = UILabel()
        element.text = "X"
        element.textColor = .black
        element.numberOfLines = 2
        element.font = .systemFont(ofSize: 14, weight: .bold)
        element.frame = CGRect(x: 20, y: 35, width: 14, height: 14)
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
        view.addSubview(flowerImageView)
        view.addSubview(thanksImageView)
        view.addSubview(okButton)
        view.addSubview(promoLabel)
        view.addSubview(cancelLabel)
        
        // Установка цвета для экрана
        view.backgroundColor = .white
    }

    // MARK: - Actions

    // Обработчик нажатия на кнопку "Хорошо" с переходом на экран Menu
    @objc private func okButtonPressed() {
        dismiss(animated: true)
    }
}
