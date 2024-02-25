// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста
final class PostTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let avatarImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 15
        return element
    }()

    private let userNameLabel = {
        let element = UILabel()
        element.textColor = .black
        element.font = UIFont(name: Constants.verdanaBold, size: 12)
        return element
    }()

    private let dotsButton = {
        let element = UIButton()
        element.setImage(.dots, for: .normal)
        element.tintColor = .black
        return element
    }()

    private let postPageControl = {
        let element = UIPageControl()
        element.pageIndicatorTintColor = .gray
        element.currentPageIndicatorTintColor = .black
        element.hidesForSinglePage = true
        return element
    }()

    private let likeButton = {
        let element = UIButton()
        element.setImage(.hurt, for: .normal)
        element.tintColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let commentButton = {
        let element = UIButton()
        element.setImage(.comments, for: .normal)
        element.tintColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let sendButton = {
        let element = UIButton()
        element.setImage(.sent, for: .normal)
        element.tintColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let saveButton = {
        let element = UIButton()
        element.setImage(.bookmark, for: .normal)
        element.tintColor = .black
        return element
    }()

    private let likeTitleLabel = {
        let element = UILabel()
        element.text = Constants.likeText
        element.textColor = .black
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    private let commentUserNameLabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.textColor = .black
        element.font = UIFont(name: Constants.verdana, size: 10)
        return element
    }()

    private let loginUserAvatarImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 10
        return element
    }()

    private let commentLoginLabel = {
        let element = UILabel()
        element.textAlignment = .left
        element.text = Constants.commentText
        element.textColor = .gray
        element.font = UIFont(name: Constants.verdana, size: 10)
        return element
    }()

    private let timePostLabel = {
        let element = UILabel()
        element.textAlignment = .left
        element.text = Constants.timeText
        element.textColor = .gray
        element.font = UIFont(name: Constants.verdana, size: 10)
        return element
    }()

    private lazy var postScrollView = {
        let element = UIScrollView()
        element.delegate = self
        element.isPagingEnabled = true
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

    func configure(post: Post) {
        addScrollViewSubviews(post.postImageNames)
        likeTitleLabel.text?.append("\(post.likes)")
        configureScrollView(postImagesCount: post.postImageNames.count)
        postPageControl.numberOfPages = post.postImageNames.count
        avatarImageView.image = UIImage(named: post.userAvatarImageName)
        userNameLabel.text = post.userName
        commentUserNameLabel.setupLabelAttribute(
            fontSize: 10,
            title: post.userName,
            descripton: post.postTitle,
            additionalText: nil
        )
        loginUserAvatarImageView.image = UIImage(named: post.loginUserAvatarImageName)
        if post.postImageNames.count == 1 {
            postScrollView.isScrollEnabled = false
        }
    }

    // MARK: - Private Methods

    private func configureScrollView(postImagesCount: Int) {
        postScrollView.contentSize.width = contentView.frame.width * CGFloat(postImagesCount) * 2

        postScrollView.showsHorizontalScrollIndicator = false
    }

    private func configureUI() {
        addSubviews()
        setupHeaderPostAnchors()
        setupActionButtons()
        setupCommentAnchors()
    }

    private func addSubviews() {
        for view in [
            userNameLabel,
            avatarImageView,
            dotsButton,
            postScrollView,
            postPageControl,
            saveButton,
            likeTitleLabel,
            commentUserNameLabel,
            loginUserAvatarImageView,
            commentLoginLabel,
            timePostLabel
        ] {
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
    }

    private func setupHeaderPostAnchors() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

        userNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6).isActive = true

        dotsButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        dotsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dotsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        dotsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true

        postScrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        postScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        postScrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func setupCommentAnchors() {
        postPageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        postPageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        postPageControl.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8).isActive = true
        postPageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        saveButton.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 24).isActive = true

        likeTitleLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6).isActive = true
        likeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        likeTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        likeTitleLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true

        commentUserNameLabel.topAnchor.constraint(equalTo: likeTitleLabel.bottomAnchor, constant: 6).isActive = true
        commentUserNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
            .isActive = true
        commentUserNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
            .isActive = true
        commentUserNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        loginUserAvatarImageView.topAnchor.constraint(equalTo: commentUserNameLabel.bottomAnchor, constant: 4)
            .isActive = true
        loginUserAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
            .isActive = true
        loginUserAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loginUserAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentLoginLabel.centerYAnchor.constraint(equalTo: loginUserAvatarImageView.centerYAnchor).isActive = true
        commentLoginLabel.leadingAnchor.constraint(equalTo: loginUserAvatarImageView.trailingAnchor, constant: 3)
            .isActive = true
        commentLoginLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentLoginLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        timePostLabel.topAnchor.constraint(equalTo: loginUserAvatarImageView.bottomAnchor, constant: 7)
            .isActive = true
        timePostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        timePostLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timePostLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        timePostLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }

    private func setupActionButtons() {
        var leadingAnchor = contentView.leadingAnchor
        for button in [likeButton, commentButton, sendButton] {
            contentView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8).isActive = true
            button.heightAnchor.constraint(equalToConstant: 24).isActive = true
            button.widthAnchor.constraint(equalToConstant: 24).isActive = true
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true

            leadingAnchor = button.trailingAnchor
        }
    }

    private func addScrollViewSubviews(_ imageNames: [String]) {
        var leadingAnchor = postScrollView.leadingAnchor
        for imageName in imageNames {
            let postImageView = UIImageView()
            postImageView.image = UIImage(named: imageName)
            postImageView.contentMode = .scaleAspectFill
            postImageView.clipsToBounds = true
            postImageView.translatesAutoresizingMaskIntoConstraints = false

            postScrollView.addSubview(postImageView)

            postImageView.topAnchor.constraint(equalTo: postScrollView.topAnchor).isActive = true
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

            leadingAnchor = postImageView.trailingAnchor
        }
    }
}

extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        postPageControl.currentPage = Int(scrollView.contentOffset.x / contentView.frame.width)
    }
}
