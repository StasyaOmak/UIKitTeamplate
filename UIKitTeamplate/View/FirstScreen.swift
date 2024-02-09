// FirstScreen.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс FierstScreen представляет пользовательский экран с различными элементами интерфейса, такими как кнопка,
/// надписи и метки.
class FierstScreen: UIView {
    lazy var startButton: UIButton = {
        let element = UIButton(type: .system)
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.tintColor = .white
        element.frame = CGRect(x: 20, y: 437, width: 335, height: 44)
        element.setTitle("Начать", for: .normal)
        element.backgroundColor = #colorLiteral(red: 0.2979461551, green: 0.8465514779, blue: 0.399361372, alpha: 1)
        element.layer.cornerRadius = 10
        return element
    }()

    var wordLabel: UILabel = {
        let element = UILabel()
        element.text = "Вы ввели слово"
        element.textAlignment = .center
        element.textColor = .black
        element.font = .systemFont(ofSize: 15, weight: .bold)
        element.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        element.isHidden = true
        return element
    }()

    var wordLabelTwo: UILabel = {
        let element = UILabel()
        element.text = "А вот что получится, если\n читать справа налево"
        element.textAlignment = .center
        element.textColor = .black
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 15, weight: .bold)
        element.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        element.isHidden = true
        return element
    }()

    var inputWord: UILabel = {
        var element = UILabel()
        element.textColor = #colorLiteral(red: 0.8000000119, green: 0.8000000119, blue: 0.8000000119, alpha: 1)
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 15, weight: .bold)
        element.frame = CGRect(x: 50, y: 163, width: 275, height: 57)
        return element
    }()

    var outputWord: UILabel = {
        var element = UILabel()
        element.textColor = #colorLiteral(red: 0.8000000119, green: 0.8000000119, blue: 0.8000000119, alpha: 1)
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 15, weight: .bold)
        element.frame = CGRect(x: 50, y: 339, width: 275, height: 57)
        return element
    }()
}
