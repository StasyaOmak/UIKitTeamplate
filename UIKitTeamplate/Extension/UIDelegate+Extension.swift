// UIDelegate+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Расширение для обработки выбора степени обжарки кофе в заказе
extension OrderCofeeViewController: CoffeeRoastSelectionDelegate {
    
    /// Установка изображения в зависимости от степени обжарки кофе.
    /// - Parameter image: Изображение, соответствующее выбранной степени обжарки кофе.
    func didSelectRoastingImage(_ image: UIImage) {
        roastingImageView.image = image
    }
    
    /// Установка текста в зависимости от степени обжарки кофе.
    /// - Parameter text: Текст, описывающий выбранную степень обжарки кофе.
    func didSelectRoastText(_ text: String) {
        roastingLabel.text = text
    }
}
