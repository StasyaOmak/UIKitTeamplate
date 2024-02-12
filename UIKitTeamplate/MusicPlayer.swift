// MusicPlayer.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс музыкального плеера для передачи данных на другой экран
final class MusicPlayer: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorController
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? PlayerViewController else {
            return
        }

        switch segue.identifier {
        case "1":
            secondVC.index = 0
        case "2":
            secondVC.index = 1
        case "3":
            secondVC.index = 2
        default: break
        }
    }
}
