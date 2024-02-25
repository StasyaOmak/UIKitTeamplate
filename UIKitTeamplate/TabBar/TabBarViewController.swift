// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка Tab Bar
final class TabBarViewController: UITabBarController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.itemPositioning = .centered
        generateTabBar()
        setTabBarAppearance()
    }

    // MARK: - Private Method

    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: NewFeedViewController(),
                title: Constants.feedTabBarName,
                image: .houseBlack
            ),
            generateVC(
                viewController: NotificationsViewController(),
                title: Constants.notificationTabBarName,
                image: .news
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: Constants.profileTabBarName,
                image: .profile
            )
        ]
    }

    private func generateVC(
        viewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }

    private func setTabBarAppearance() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
    }
}
