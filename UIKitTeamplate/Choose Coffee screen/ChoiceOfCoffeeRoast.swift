// ChoiceOfCoffeeRoast.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отвечает за экран выбора степени обжарки кофе.
final class ChoiceOfCoffeeRoast: UIViewController {
    // MARK: - Properties
    var delegate: CoffeeRoastSelectionDelegate?
    var selectedRoastText: String?

    lazy var roastingDarkButton: UIButton = {
        let element = UIButton()
        element.layer.cornerRadius = 16
        element.backgroundColor = .coffeeButton
        element.layer.cornerRadius = 12
        element.layer.borderColor = UIColor.buttonBlue.cgColor
        element.frame = CGRect(x: 15, y: 164, width: 165, height: 165)
        element.addTarget(self, action: #selector(roastingDarkButtonTouchDown), for: .touchDown)
        element.addTarget(self, action: #selector(roastingDarkButtonTouchUpInside), for: .touchUpInside)
        return element
    }()
    
    lazy var roastingLightButton: UIButton = {
        let element = UIButton()
        element.layer.cornerRadius = 16
        element.backgroundColor = .coffeeButton
        element.layer.cornerRadius = 12
        element.layer.borderColor = UIColor.buttonBlue.cgColor
        element.frame = CGRect(x: 195, y: 164, width: 165, height: 165)
        element.addTarget(self, action: #selector(roastingLightButtonTouchDown), for: .touchDown)
        element.addTarget(self, action: #selector(roastingLightButtonTouchUpInside), for: .touchUpInside)
        return element
    }()

    // MARK: - Private Properties
    private lazy var closeButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "xmark"), for: .normal)
        element.tintColor = .black
        element.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return element
    }()

    private lazy var choiceLabel: UILabel = {
        let element = UILabel()
        element.text = "Уточните обжарку зеренъ"
        element.textColor = .black
        element.textAlignment = .center
        element.font = UIFont(name: "Verdana-Bold", size: 18)
        element.frame = CGRect(x: 40, y: 115, width: 294, height: 30)
        return element
    }()

    private lazy var roastingDarkImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 31, y: 17, width: 100, height: 100)
        element.image = UIImage(named: "darkRoast")
        return element
    }()

    private lazy var roastingDarkLabel: UILabel = {
        let element = UILabel()
        element.text = "Темная\nобжарка"
        element.textColor = .black
        element.numberOfLines = 2
        element.font = UIFont(name: "Verdana", size: 13)
        element.frame = CGRect(x: 55, y: 117, width: 165, height: 34)
        return element
    }()

    private lazy var roastingLightImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 31, y: 17, width: 100, height: 100)
        element.image = UIImage(named: "lightRoast")
        return element
    }()

    private lazy var roastingLightLabel: UILabel = {
        let element = UILabel()
        element.text = "Свѣтлая\nобжарка"
        element.textColor = .black
        element.numberOfLines = 2
        element.font = UIFont(name: "Verdana", size: 13)
        element.frame = CGRect(x: 55, y: 117, width: 165, height: 34)
        return element
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(closeButton)
        view.addSubview(choiceLabel)
        view.addSubview(roastingDarkButton)
        roastingDarkButton.addSubview(roastingDarkImageView)
        roastingDarkButton.addSubview(roastingDarkLabel)
        view.addSubview(roastingLightButton)
        roastingLightButton.addSubview(roastingLightImageView)
        roastingLightButton.addSubview(roastingLightLabel)
    }

    @objc private func roastingDarkButtonTouchDown() {
        roastingDarkButton.layer.borderWidth = 1
        roastingLightButton.layer.borderWidth = 0
    }

    @objc private func roastingDarkButtonTouchUpInside() {
        roastingDarkButton.backgroundColor = .coffeeButton
        if let selectedImage = roastingDarkImageView.image {
            delegate?.didSelectRoastingImage(selectedImage)
        }
        delegate?.didSelectRoastText(roastingDarkLabel.text ?? "")
    }

    @objc private func roastingLightButtonTouchDown() {
        roastingLightButton.layer.borderWidth = 1
        roastingDarkButton.layer.borderWidth = 0
    }

    @objc private func roastingLightButtonTouchUpInside() {
        roastingLightButton.backgroundColor = .coffeeButton
        if let selectedImage = roastingLightImageView.image {
            delegate?.didSelectRoastingImage(selectedImage)
        }
        delegate?.didSelectRoastText(roastingLightLabel.text ?? "")
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
