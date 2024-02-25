// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для историй
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private lazy var addStoryButton: UIButton = {
        let element = UIButton()
        element.setBackgroundImage(.plus, for: .normal)
        element.setTitle(Constants.plusSign, for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let storiesScrollView: UIScrollView = {
        let element = UIScrollView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScrollViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(with stories: [Stories]) {
        configureScrollViewUI(with: stories.count)
        createStoryViews(stories)
    }

    // MARK: - Private Methods

    private func configureScrollViewUI(with count: Int) {
        storiesScrollView.contentSize.width = 80 * CGFloat(count)
        storiesScrollView.showsVerticalScrollIndicator = false
        storiesScrollView.showsHorizontalScrollIndicator = false
    }

    private func setupScrollViewConstraints() {
        contentView.addSubview(storiesScrollView)

        storiesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storiesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        storiesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        storiesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    private func createStoryViews(_ stories: [Stories]) {
        var leadingAnchor = storiesScrollView.leadingAnchor

        for story in stories {
            let usernameLabel = createLabel(with: story.userName, isGray: story.isSelfStory)
            let avatarImageView = createAvatarImageView(named: story.imageName)

            storiesScrollView.addSubview(usernameLabel)
            storiesScrollView.addSubview(avatarImageView)

            if story.isSelfStory {
                usernameLabel.textColor = .gray
                storiesScrollView.addSubview(addStoryButton)
                setupAddStoryButtonConstraints(on: avatarImageView)
            }

            setupAvatarImageViewConstraints(
                on: avatarImageView,
                leadingAnchor: leadingAnchor,
                isSelfStory: story.isSelfStory
            )
            setupUsernameLabelConstraints(on: usernameLabel, avatarImageView: avatarImageView)

            leadingAnchor = avatarImageView.trailingAnchor
        }
    }

    private func createLabel(with text: String, isGray: Bool) -> UILabel {
        let element = UILabel()
        element.text = text
        element.textColor = isGray ? .gray : .black
        element.textAlignment = .center
        element.font = UIFont(name: Constants.verdana, size: 10)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }

    private func createAvatarImageView(named imageName: String) -> UIImageView {
        let element = UIImageView()
        element.image = UIImage(named: imageName)
        element.contentMode = .scaleAspectFill
        element.layer.cornerRadius = 30
        element.clipsToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }

    private func setupAddStoryButtonConstraints(on avatarImageView: UIImageView) {
        addStoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addStoryButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        addStoryButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        addStoryButton.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
    }

    private func setupAvatarImageViewConstraints(
        on imageView: UIImageView,
        leadingAnchor: NSLayoutXAxisAnchor,
        isSelfStory: Bool
    ) {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isSelfStory ? 12 : 22).isActive = true
    }

    private func setupUsernameLabelConstraints(on label: UILabel, avatarImageView: UIImageView) {
        label.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        label.widthAnchor.constraint(equalToConstant: 74).isActive = true
        label.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor).isActive = true
    }
}
