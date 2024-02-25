// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для отображения уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Types

    private enum TableSectionTypes: String {
        /// Сегодня
        case today = "Сегодня"
        /// На этой неделе
        case week = "На этой неделе"
    }

    private enum TableCellTypes {
        /// Подписка
        case subscribe
        /// Действиия с постом
        case commentPost
    }

    // MARK: - Visual Components

    private let notificationTableView = UITableView()

    private let requestsButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .left
        button.setTitle(Constants.requsetText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdana, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let cellTypes: [TableCellTypes] = [.commentPost, .subscribe]
    private let sectionTypes: [TableSectionTypes] = [.today, .week]

    private var notifications = [
        [
            Notification(
                userName: Constants.firstPostUserName,
                title: Constants.likePostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                time: "\(12)\(Constants.hours)",
                postImageName: Constants.seaImageName, isMentioned: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                title: Constants.mentionPostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                time: "\(12)\(Constants.hours)",
                postImageName: Constants.seaImageName, isMentioned: true
            )
        ],
        [
            Notification(
                userName: Constants.firstPostUserName,
                title: Constants.commentPostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                time: "\(3)\(Constants.days)",
                postImageName: Constants.museumImageName, isMentioned: false
            ),
            Notification(
                userName: Constants.secondPostUserName,
                title: Constants.newUserText,
                avatarUserImageName: Constants.secondUserImageName,
                time: "\(3)\(Constants.days)",
                postImageName: nil, isMentioned: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                title: Constants.subscribeTextNotification,
                avatarUserImageName: Constants.fisrtUserImageName,
                time: "\(5)\(Constants.days)",
                postImageName: nil, isMentioned: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                title: Constants.likeCommentText,
                avatarUserImageName: Constants.fisrtUserImageName,
                time: "\(7)\(Constants.days)",
                postImageName: Constants.museumImageName, isMentioned: false
            ),
            Notification(
                userName: Constants.thirdPostUserName,
                title: Constants.newUserText,
                avatarUserImageName: Constants.thirdUserImageName,
                time: "\(8)\(Constants.days)",
                postImageName: nil, isMentioned: false
            ),
            Notification(
                userName: Constants.fourPostUserName,
                title: Constants.newUserText,
                avatarUserImageName: Constants.fourUserImageName,
                time: "\(8)\(Constants.days)",
                postImageName: nil, isMentioned: false
            )
        ]
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUI()
        configureTableView()
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        title = Constants.controllerTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureTableView() {
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.backgroundColor = .white
        notificationTableView.showsVerticalScrollIndicator = false
        notificationTableView.separatorStyle = .none
        notificationTableView.register(
            SubscriptionTableViewCell.self,
            forCellReuseIdentifier: String(describing: SubscriptionTableViewCell.self)
        )
        notificationTableView.register(
            CommentPostTableViewCell.self,
            forCellReuseIdentifier: String(describing: CommentPostTableViewCell.self)
        )
    }

    private func configureUI() {
        view.backgroundColor = .white
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        view.addSubview(requestsButton)
        view.addSubview(notificationTableView)
    }

    private func setupAnchors() {
        requestsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        requestsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        requestsButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        requestsButton.widthAnchor.constraint(equalToConstant: 251).isActive = true

        notificationTableView.topAnchor.constraint(equalTo: requestsButton.bottomAnchor).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }
}

// MARK: - NotificationViewController + UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if notifications[indexPath.section][indexPath.row].isPostNotification {
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: SubscriptionTableViewCell.self), for: indexPath
                ) as? SubscriptionTableViewCell
            else { return UITableViewCell() }
            cell.configure(notification: notifications[indexPath.section][indexPath.row])
            return cell
        } else {
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: CommentPostTableViewCell.self), for: indexPath
                ) as? CommentPostTableViewCell
            else { return UITableViewCell() }
            cell.configure(notification: notifications[indexPath.section][indexPath.row])
            return cell
        }
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        notifications[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

// MARK: - NotificationViewController + UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: 14)
        label.text = sectionTypes[section].rawValue
        return label
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
