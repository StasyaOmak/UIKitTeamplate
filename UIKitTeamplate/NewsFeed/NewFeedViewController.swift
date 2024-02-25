// NewFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для отображения ленты
final class NewFeedViewController: UIViewController {
    private enum TableCellTypes {
        // истории
        case stories
        // первый пост
        case firstPost
        // посты после рекомендации
        case post
        // рекомендации
        case recommends
    }

    private let newFeedTableView = UITableView()

    private lazy var refreshControl = {
        let element = UIRefreshControl()
        element.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        return element
    }()

    private let cellTypes: [TableCellTypes] = [.stories, .firstPost, .recommends, .post]

    private let stories: [Stories] = [
        Stories(userName: Constants.myStoryTitle, imageName: Constants.ovnerImageName, isSelfStory: true),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false),
        Stories(userName: Constants.userName, imageName: Constants.userImageName, isSelfStory: false)
    ]

    private let posts = [
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.userAvatarImageName,
            postImageNames: [Constants.dagestanImage, Constants.canyonImage],
            likes: 201,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.ovnerImageName
        ),
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.userAvatarImageName,
            postImageNames: [Constants.dagestanImage, Constants.canyonImage],
            likes: 201,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.ovnerImageName
        ),
    ]
    private let recommends = [
        Recommend(avatarImage: Constants.recommendCrimeaImage, nikname: Constants.niknameFierst),
        Recommend(avatarImage: Constants.recommendWomanImage, nikname: Constants.niknameSecond),
    ]

    private let firstPost =
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.userAvatarImageName,
            postImageNames: [Constants.dagestanImage, Constants.canyonImage],
            likes: 201,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.ovnerImageName
        )

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigionBar()
        setupView()
        setupConstraints()
    }

    // MARK: - Private Properties

    private func setupView() {
        view.addSubview(newFeedTableView)
        newFeedTableView.refreshControl = refreshControl
        newFeedTableView.dataSource = self
        newFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        newFeedTableView.dataSource = self
        newFeedTableView.register(
            StoriesTableViewCell.self,
            forCellReuseIdentifier: String(describing: StoriesTableViewCell.self)
        )
        newFeedTableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self)
        )
        newFeedTableView.register(
            RecommendTableViewCell.self,
            forCellReuseIdentifier: String(describing: RecommendTableViewCell.self)
        )
    }

    private func setupNavigionBar() {
        let messegeImage = UIImage.messege
        let messegeBarItem = UIBarButtonItem(image: messegeImage, style: .plain, target: nil, action: nil)
        messegeBarItem.tintColor = .black
        navigationItem.rightBarButtonItem = messegeBarItem

        let rmLinkImage = UIImage.rmLinkText
        let rmLinkBarItem = UIBarButtonItem(image: rmLinkImage, style: .plain, target: nil, action: nil)
        rmLinkBarItem.tintColor = .black
        navigationItem.leftBarButtonItem = rmLinkBarItem
    }

    @objc private func refreshTableView(_ sender: Any) {
        newFeedTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension NewFeedViewController {
    func setupConstraints() {
        newFeedTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        newFeedTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        newFeedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        newFeedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension NewFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = cellTypes[section]
        switch type {
        case .stories, .recommends, .firstPost:
            return 1
        case .post:
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: StoriesTableViewCell.self), for: indexPath
                ) as? StoriesTableViewCell
            else { return UITableViewCell() }
            cell.configure(with: stories)
            return cell
        case .post, .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: PostTableViewCell.self), for: indexPath
                ) as? PostTableViewCell
            else { return UITableViewCell() }
            if cellType == .firstPost {
                cell.configure(post: firstPost)
            } else {
                cell.configure(post: posts[indexPath.row])
            }
            return cell
        case .recommends:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: RecommendTableViewCell.self), for: indexPath
                ) as? RecommendTableViewCell
            else { return UITableViewCell() }
            cell.configure(recommends: recommends)
            return cell
        }
    }
}
