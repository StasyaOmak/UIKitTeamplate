// ReservationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс с контроллером представления, который вызывает алерт для запроса чека

final class ReservationViewController: UIViewController {
    // MARK: - Private Methods

    @IBAction private func takeBill(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Выставить счет?",
            message: nil,
            preferredStyle: .alert
        )
        let actionCancel = UIAlertAction(title: "Отмена", style: .default)
        let actionCheck = UIAlertAction(title: "Чек", style: .default) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let checkViewController = storyboard.instantiateViewController(withIdentifier: "billViewController")

            self.navigationController?.pushViewController(checkViewController, animated: true)
        }

        alertController.addAction(actionCancel)
        alertController.addAction(actionCheck)
        alertController.preferredAction = actionCheck

        present(alertController, animated: true)
    }
}
