// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarViewController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
