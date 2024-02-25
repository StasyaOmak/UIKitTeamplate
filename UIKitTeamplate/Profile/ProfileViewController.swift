// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с профилем пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Types

    enum CellTypes {
        /// Ячейчка профиля
        case profileInfo
        /// Ячейчка с историями
        case stories
        /// Ячейка с постами
        case posts
    }

    // MARK: - Visual Components

    private let profileTableView = UITableView()
    private lazy var refreshTableControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        return refreshControl
    }()

    // MARK: - Private Properties

    private let cellTypes: [CellTypes] = [.profileInfo, .stories, .posts]
    private let stories = [
        ProfileStory(nameStory: Constants.launchTitle, imageName: Constants.startRoketImage),
        ProfileStory(nameStory: Constants.moonTitle, imageName: Constants.moonImage),
        ProfileStory(nameStory: Constants.astronautTitle, imageName: Constants.spaceUserImage),
        ProfileStory(nameStory: Constants.spaceTitle, imageName: Constants.spaceImage),
        ProfileStory(nameStory: Constants.launchTitle, imageName: Constants.startRoketImage),
        ProfileStory(nameStory: Constants.launchTitle, imageName: Constants.startRoketImage),
        ProfileStory(nameStory: Constants.launchTitle, imageName: Constants.startRoketImage),
        ProfileStory(nameStory: Constants.launchTitle, imageName: Constants.startRoketImage),
    ]
    private let postNames = [
        Constants.earthLightsImage,
        Constants.earthImage,
        Constants.flyRocketImage,
        Constants.seaRocketImage,
        Constants.earthImage,
        Constants.earthLightsImage,
        Constants.seaRocketImage,
        Constants.earthImage,
        Constants.earthLightsImage,
        Constants.seaRocketImage,
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUI()
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white

        let lockBarItem = UIBarButtonItem(image: .lock, style: .plain, target: nil, action: nil)
        lockBarItem.tintColor = .black

        let userNameLabel = UILabel()
        userNameLabel.text = Constants.myProfileName
        userNameLabel.font = UIFont(name: Constants.verdanaBold, size: 18)

        let userNameBarButtonItem = UIBarButtonItem(customView: userNameLabel)

        navigationItem.setLeftBarButtonItems([lockBarItem, userNameBarButtonItem], animated: true)

        let listButton = UIButton()
        listButton.setImage(.list, for: .normal)
        listButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let listBarItem = UIBarButtonItem(customView: listButton)

        let addButton = UIButton()
        addButton.setImage(.borderedAdd, for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let listAddSpace = UIBarButtonItem(systemItem: .fixedSpace)
        listAddSpace.width = 3

        let addBarItem = UIBarButtonItem(customView: addButton)

        navigationItem.setRightBarButtonItems([listBarItem, listAddSpace, addBarItem], animated: true)
    }

    private func configureUI() {
        view.backgroundColor = .white
        addSubviews()
        setupTableView()
    }

    private func addSubviews() {
        view.addSubview(profileTableView)
    }

    private func setupTableView() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.dataSource = self
        profileTableView.refreshControl = refreshTableControl
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.separatorStyle = .none
        profileTableView.register(
            HeaderTableViewCell.self,
            forCellReuseIdentifier: String(describing: HeaderTableViewCell.self)
        )
        profileTableView.register(
            ProfileStoriesTableViewCell.self,
            forCellReuseIdentifier: String(describing: ProfileStoriesTableViewCell.self)
        )
        profileTableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: String(describing: PhotosTableViewCell.self)
        )
        setupProfileTableViewAnchors()
    }

    private func setupProfileTableViewAnchors() {
        profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        profileTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    @objc private func refreshTable() {
        profileTableView.reloadData()
        refreshTableControl.endRefreshing()
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .profileInfo:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath
                ) as? HeaderTableViewCell
            else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: ProfileStoriesTableViewCell.self), for: indexPath
                ) as? ProfileStoriesTableViewCell
            else { return UITableViewCell() }
            cell.configure(stories: stories)
            cell.delegate = self
            return cell
        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath
                ) as? PhotosTableViewCell
            else { return UITableViewCell() }
            cell.configure(posts: postNames)
            return cell
        }
    }
}

// MARK: - ProfileViewController + Openable

extension ProfileViewController: Openable {
    func openBrowser() {
        present(BrowserViewController(), animated: true)
    }
}

// MARK: - ProfileViewController + Storybale

extension ProfileViewController: Storybale {
    func openFullStory(imageName: UIImage) {
        let storyViewController = StoryViewController()
        storyViewController.setupImage(mainImageName: imageName)
        present(storyViewController, animated: true)
    }
}
