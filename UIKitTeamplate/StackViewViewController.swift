// StackViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сфетофор на Stack View
final class StackViewViewController: UIViewController {
    // MARK: - Visual Components

    private var stackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 10
        element.axis = .vertical
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private var blackRectangleView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private var redSquareView: UIView = {
        let element = UIView()
        element.backgroundColor = .red
        return element
    }()

    private var yellowSquareView: UIView = {
        let element = UIView()
        element.backgroundColor = .yellow
        return element
    }()

    private var greenSquareView: UIView = {
        let element = UIView()
        element.backgroundColor = .green
        return element
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(blackRectangleView)
        blackRectangleView.addSubview(stackView)
        stackView.addArrangedSubview(redSquareView)
        stackView.addArrangedSubview(yellowSquareView)
        stackView.addArrangedSubview(greenSquareView)
        setStackViewAnchor()
        setRectangleAnchor()
    }
}

// MARK: - Layoyt

extension StackViewViewController {
    private func setStackViewAnchor() {
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4).isActive = true
    }

    private func setRectangleAnchor() {
        blackRectangleView.topAnchor.constraint(equalTo: redSquareView.topAnchor, constant: -10).isActive = true
        blackRectangleView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        blackRectangleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10).isActive = true
        blackRectangleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
    }
}
