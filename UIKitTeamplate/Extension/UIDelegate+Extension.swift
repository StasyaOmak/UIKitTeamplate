// UIDelegate+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Extension CoffeeRoastSelectionDelegate

extension OrderCofeeViewController: CoffeeRoastSelectionDelegate {
    // Установка изображения в зависимости от степени обжарки
    func didSelectRoastingImage(_ image: UIImage) {
        roastingImageView.image = image
    }

    // Установка текста в зависимости от степени обжарки
    func didSelectRoastText(_ text: String) {
        roastingLabel.text = text
    }
}
