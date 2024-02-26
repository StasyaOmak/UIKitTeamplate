// NSLayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с якорями
final class NSLayoutAnchorViewController: UIViewController {
    // MARK: - Visual Components

    private var blackRectangleView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
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
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(blackRectangleView)
        view.addSubview(yellowSquareView)
        view.addSubview(redSquareView)
        view.addSubview(greenSquareView)
        makeAnchor()
    }

    private func makeAnchor() {
        makeYellowSqureAnchor()
        makeRedSqureAnchor()
        makeGreenSqureAnchor()
        makeBlackSqureAnchor()
    }
}

// MARK: - Layoyt

extension NSLayoutAnchorViewController {
    private func makeYellowSqureAnchor() {
        yellowSquareView.translatesAutoresizingMaskIntoConstraints = false
        yellowSquareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowSquareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowSquareView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4).isActive = true
        yellowSquareView.widthAnchor.constraint(equalTo: yellowSquareView.heightAnchor).isActive = true
    }

    private func makeRedSqureAnchor() {
        redSquareView.translatesAutoresizingMaskIntoConstraints = false
        redSquareView.bottomAnchor.constraint(equalTo: yellowSquareView.topAnchor, constant: -10).isActive = true
        redSquareView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        redSquareView.leadingAnchor.constraint(equalTo: yellowSquareView.leadingAnchor).isActive = true
        redSquareView.trailingAnchor.constraint(equalTo: yellowSquareView.trailingAnchor).isActive = true
        redSquareView.heightAnchor.constraint(equalTo: yellowSquareView.heightAnchor).isActive = true
    }

    private func makeGreenSqureAnchor() {
        greenSquareView.translatesAutoresizingMaskIntoConstraints = false
        greenSquareView.topAnchor.constraint(equalTo: yellowSquareView.bottomAnchor, constant: 10).isActive = true
        greenSquareView.leadingAnchor.constraint(equalTo: yellowSquareView.leadingAnchor).isActive = true
        greenSquareView.trailingAnchor.constraint(equalTo: yellowSquareView.trailingAnchor).isActive = true
        greenSquareView.heightAnchor.constraint(equalTo: yellowSquareView.heightAnchor).isActive = true
    }

    private func makeBlackSqureAnchor() {
        blackRectangleView.translatesAutoresizingMaskIntoConstraints = false
        blackRectangleView.topAnchor.constraint(equalTo: redSquareView.topAnchor, constant: -10).isActive = true
        blackRectangleView.leadingAnchor.constraint(equalTo: yellowSquareView.leadingAnchor, constant: -10)
            .isActive = true
        blackRectangleView.trailingAnchor.constraint(equalTo: yellowSquareView.trailingAnchor, constant: 10)
            .isActive = true
        blackRectangleView.bottomAnchor.constraint(equalTo: greenSquareView.bottomAnchor, constant: 10).isActive = true
    }
}
