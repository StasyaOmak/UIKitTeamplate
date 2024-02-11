// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс реализовывает отображение списка  именинников
final class BirthdayReminderViewController: UIViewController {
    private lazy var helenaImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 19, y: 105, width: 75, height: 75)
        element.image = UIImage(named: "helenaLink")
        return element
    }()

    private lazy var veronaImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 20, y: 200, width: 75, height: 75)
        element.image = UIImage(named: "veronaTusk")
        return element
    }()

    private lazy var alexImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 20, y: 295, width: 75, height: 75)
        element.image = UIImage(named: "alexSmith")
        return element
    }()

    private lazy var tomImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 22, y: 390, width: 75, height: 75)
        element.image = UIImage(named: "tomJohnson")
        return element
    }()

    private lazy var cakeImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        element.image = UIImage(named: "birthdayCake")
        return element
    }()

    var helenaNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Helena Link"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        return element
    }()

    var helenaBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "10.03 - turns 25!"
        element.textColor = .black
        element.font = .systemFont(ofSize: 14, weight: .light)
        element.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        return element
    }()

    var veronaNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Verona Tusk"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 103, y: 214, width: 209, height: 20)
        return element
    }()

    var veronaBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "20.03 - turns 39"
        element.textColor = .black
        element.font = .systemFont(ofSize: 14, weight: .light)
        element.frame = CGRect(x: 103, y: 242, width: 209, height: 20)
        return element
    }()

    var alexNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Alex Smith"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 103, y: 309, width: 209, height: 20)
        return element
    }()

    var alexBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "21.04 - turns 51"
        element.textColor = .black
        element.font = .systemFont(ofSize: 14, weight: .light)
        element.frame = CGRect(x: 103, y: 337, width: 209, height: 20)
        return element
    }()

    var tomNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Tom Johnson"
        element.textColor = .black
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 104, y: 404, width: 209, height: 20)
        return element
    }()

    var tomBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "05.06 - turns 18"
        element.textColor = .black
        element.font = .systemFont(ofSize: 14, weight: .light)
        element.frame = CGRect(x: 105, y: 432, width: 209, height: 20)
        return element
    }()

    var veronaDaysBeforeBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "10\ndays"
        element.numberOfLines = 2
        element.textColor = UIColor(named: "extraColor")
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 315, y: 214, width: 42, height: 44)
        return element
    }()

    var alexDaysBeforeBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "42\ndays"
        element.numberOfLines = 2
        element.textColor = UIColor(named: "extraColor")
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 315, y: 309, width: 42, height: 44)
        return element
    }()

    var tomDaysBeforeBirthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "42\ndays"
        element.numberOfLines = 2
        element.textColor = UIColor(named: "extraColor")
        element.font = .systemFont(ofSize: 16, weight: .bold)
        element.frame = CGRect(x: 317, y: 404, width: 42, height: 44)
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        setupViews()
    }

    private func setupViews() {
        view.addSubview(helenaImageView)
        view.addSubview(veronaImageView)
        view.addSubview(alexImageView)
        view.addSubview(tomImageView)
        view.addSubview(cakeImageView)
        view.addSubview(helenaNameLabel)
        view.addSubview(helenaBirthdayLabel)
        view.addSubview(veronaNameLabel)
        view.addSubview(veronaBirthdayLabel)
        view.addSubview(alexNameLabel)
        view.addSubview(alexBirthdayLabel)
        view.addSubview(tomNameLabel)
        view.addSubview(tomBirthdayLabel)
        view.addSubview(veronaDaysBeforeBirthdayLabel)
        view.addSubview(alexDaysBeforeBirthdayLabel)
        view.addSubview(tomDaysBeforeBirthdayLabel)
    }

    private func navigationBarSetup() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Birthday Reminder"
        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )

        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc func addButtonTapped() {
        let contactInfoViewController = ContactInfoViewController()
        contactInfoViewController.modalPresentationStyle = .popover
        present(contactInfoViewController, animated: true)
    }
}
