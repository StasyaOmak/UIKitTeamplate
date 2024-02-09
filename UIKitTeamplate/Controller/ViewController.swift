// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController - контроллер экрана, отображающий пользовательский интерфейс и обрабатывающий действия
/// пользователя при нажатии на кнопку.
final class ViewController: UIViewController {
    // MARK: - Constants

    let mainView = FierstScreen()
    let model = Reverse()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView.startButton)
        view.addSubview(mainView.wordLabel)
        view.addSubview(mainView.wordLabelTwo)
        view.addSubview(mainView.inputWord)
        view.addSubview(mainView.outputWord)
        mainView.startButton.addTarget(self, action: #selector(addWordAlert), for: .allEvents)

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    // MARK: - Private Methods

    @objc private func addWordAlert() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { _ in
            self.mainView.startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
            self.mainView.wordLabel.isHidden = false
            self.mainView.inputWord.text = alertController.textFields?.first?.text?.capitalized ?? ""
            self.mainView.wordLabelTwo.isHidden = false
            guard let word = alertController.textFields?.first?.text else { return }
            self.mainView.outputWord.text = self.model.reversed(word: word).capitalized

        })
        present(alertController, animated: true)
    }
}
