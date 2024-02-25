// CommentTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейчка уведомления о посте
final class CommentPostTableViewCell: UITableViewCell {
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

    private let likeButton: UIButton = {
        let element = UIButton()
        element.setImage(.hurt, for: .normal)
        element.isHidden = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let replyButton: UIButton = {
        let element = UIButton()
        element.setTitle(Constants.replyText, for: .normal)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 10)
        element.contentHorizontalAlignment = .left
        element.isHidden = true
        element.setTitleColor(.gray, for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let postImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
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
        postImageView.image = UIImage(named: notification.postImageName ?? "")
        if notification.isMentioned {
            likeButton.isHidden = false
            replyButton.isHidden = false
        }
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(notificationTextLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(replyButton)
    }

    private func setupUserImageViewAnchors() {
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupNotificationTextLabelAnchors() {
        notificationTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 7)
            .isActive = true
        notificationTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }

    private func setupPostImageViewAnchors() {
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupLikeButtonAnchors() {
        likeButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 9).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
    }

    private func setupReplyButtonAnchors() {
        replyButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
        replyButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
        replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupAnchors() {
        setupUserImageViewAnchors()
        setupNotificationTextLabelAnchors()
        setupPostImageViewAnchors()
        setupLikeButtonAnchors()
        setupReplyButtonAnchors()
    }
}
