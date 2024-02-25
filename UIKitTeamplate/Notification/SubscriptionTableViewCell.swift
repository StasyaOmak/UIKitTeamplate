// SubscriptionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейки подписки
final class SubscriptionTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.layer.cornerRadius = 20
        element.clipsToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let notificationTextLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.textColor = .black
        element.textAlignment = .left
        element.font = UIFont(name: Constants.verdana, size: 12)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var subscribeButton: UIButton = {
        let element = UIButton()
        element.setTitle(Constants.subscribeTextTwo, for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.backgroundColor = .recommendButton
        element.layer.cornerRadius = 8
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor.clear.cgColor
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 12)
        element.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(notification: Notification) {
        userImageView.image = UIImage(named: notification.avatarUserImageName)
        notificationTextLabel.setupLabelAttribute(
            fontSize: 12, title: notification.userName,
            descripton: notification.title,
            additionalText: notification.time
        )
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(notificationTextLabel)
        contentView.addSubview(subscribeButton)
    }

    private func setupUserImageViewConstraints() {
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupNotificationTextLabelConstraints() {
        notificationTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 7)
            .isActive = true
        notificationTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        notificationTextLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
    }

    private func setupSubscribeButtonConstraints() {
        subscribeButton.centerYAnchor.constraint(equalTo: notificationTextLabel.centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func setupAnchors() {
        setupUserImageViewConstraints()
        setupNotificationTextLabelConstraints()
        setupSubscribeButtonConstraints()
    }

    @objc private func subscribeButtonTapped(_ button: UIButton) {
        if button.backgroundColor == .recommendButton {
            button.setTitle(Constants.youSubscribeText, for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.gray.cgColor
        } else {
            button.setTitle(Constants.subscribeText, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .recommendButton
            button.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
