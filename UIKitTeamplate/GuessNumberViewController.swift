// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер угадай число и калькулятор
final class guessNumberViewController: UIViewController {
    // MARK: - Constants

    let newView = UIView()
    let frame = UIScreen.main.bounds

    // MARK: - Private Properties

    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.backgroundColor = #colorLiteral(red: 0.5936434865, green: 0.7938520312, blue: 0.8973758817, alpha: 1)
        element.frame = CGRect(x: 0, y: 37, width: 375, height: 82)
        element.textAlignment = .center
        element.font = .boldSystemFont(ofSize: 25)
        element.text = "Приветствую,\n"
        element.numberOfLines = 0
        element.layer.borderWidth = 3
        element.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        element.textColor = .white
        return element
    }()

    private lazy var background: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Background")
        element.frame = CGRect(x: 0, y: 37, width: 375, height: 775)
        return element
    }()

    private lazy var guessingButton: UIButton = {
        let element = UIButton(type: .system)
        element.frame = CGRect(x: 82, y: 264, width: 150, height: 150)
        element.backgroundColor = #colorLiteral(red: 0.6101519465, green: 0.4977072477, blue: 0.7082346082, alpha: 1)
        element.layer.cornerRadius = 30
        element.layer.borderWidth = 3
        element.layer.borderColor = #colorLiteral(red: 0.2991576493, green: 0.1407449841, blue: 0.4514412284, alpha: 1)
        element.setTitle("Угадай число", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.numberOfLines = 0
        element.titleLabel?.font = .boldSystemFont(ofSize: 25)
        element.titleLabel?.textAlignment = .center
        element.addTarget(nil, action: #selector(guessNumberAlert), for: .touchUpInside)
        return element
    }()

    private lazy var calculatorButton: UIButton = {
        let element = UIButton(type: .system)
        element.frame = CGRect(x: 132, y: 470, width: 200, height: 200)
        element.backgroundColor = #colorLiteral(red: 0.3939370811, green: 0.7096473575, blue: 0.5092409849, alpha: 1)
        element.layer.cornerRadius = 30
        element.layer.borderWidth = 3
        element.layer.borderColor = #colorLiteral(red: 0.2317697704, green: 0.4123368561, blue: 0.2966381311, alpha: 1)
        element.setTitle("Калькулятор", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = .boldSystemFont(ofSize: 25)
        element.titleLabel?.textAlignment = .center
        element.addTarget(nil, action: #selector(addCalculateNumbersAlert), for: .touchUpInside)
        return element
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        greatingAlert()
    }

    private func setupView() {
        view.addSubview(newView)
        view.addSubview(background)
        view.addSubview(nameLabel)
        view.addSubview(guessingButton)
        view.addSubview(calculatorButton)
        
        newView.frame = frame
        newView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    // MARK: - Private Methods

    @objc private func addCalculateNumbersAlert() {
        let calculateAlert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        calculateAlert.addTextField { textField in
            textField.placeholder = "Число 1"
        }

        calculateAlert.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        let appendAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            let firstNumber = Int(calculateAlert.textFields?[0].text ?? "0") ?? 0
            let secondNumber = Int(calculateAlert.textFields?[1].text ?? "0") ?? 0

            self.getResultAlert(firstNumber, secondNumber) { $0 + $1 }
        }
        calculateAlert.addAction(appendAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        calculateAlert.addAction(cancelAction)

        present(calculateAlert, animated: true)
    }

    private func getResultAlert(
        _ firstNumber: Int,
        _ secondNumber: Int,
        operation: (Int, Int) -> Int
    ) {
        let resultAlert = UIAlertController(
            title: "Ваш результат",
            message: "Результат вычислений - \(operation(firstNumber, secondNumber))",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Ок", style: .default)
        resultAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        resultAlert.addAction(cancelAction)

        present(resultAlert, animated: true)
    }

    private func greatingAlert() {
        let greatingAlert = UIAlertController(title: "Пожалуйста, представьтесь!", message: nil, preferredStyle: .alert)
        greatingAlert.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let nameText = greatingAlert.textFields?.first?.text
            self.nameLabel.text?.append("\(nameText ?? "no name")!")
        }

        greatingAlert.addAction(action)
        present(greatingAlert, animated: true)
    }

    @objc private func guessNumberAlert() {
        let guessNumberAlert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        guessNumberAlert.addTextField { textField in
            textField.placeholder = "Введите ваше число"
        }
        let guessingNumber = Int.random(in: 1 ... 10)
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            let number = Int(guessNumberAlert.textFields?[0].text ?? "0") ?? 0
            if number == guessingNumber {
                self.congratsAlert()
            } else {
                self.failAlert()
            }
        }
        guessNumberAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        guessNumberAlert.addAction(cancelAction)

        present(guessNumberAlert, animated: true)
    }

    private func congratsAlert() {
        let congratsAlert = UIAlertController(
            title: "Поздравляю, вы угадали",
            message: "Вы угадали",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Ок", style: .default)
        congratsAlert.addAction(okAction)

        present(congratsAlert, animated: true)
    }

    private func failAlert() {
        let failAlert = UIAlertController(title: "Упс!", message: "Это не верный ответ", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ок", style: .default)
        failAlert.addAction(okAction)

        present(failAlert, animated: true)
    }
}
