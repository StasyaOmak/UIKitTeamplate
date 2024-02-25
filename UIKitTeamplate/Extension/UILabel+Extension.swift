// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для работы с атрибутами
extension UILabel {
    /// Метод добавляющий аттрибуты для label
    /// - Parameter fontSize: Размер  атрибута
    /// - Parameter title: Текст заголовка
    /// - Parameter descripton: Основной текст
    /// - Parameter additionalText: Дополнительный текст
    func setupLabelAttribute(fontSize: CGFloat, title: String, descripton: String, additionalText: String?) {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.font: UIFont(name: Constants.verdanaBold, size: 10) ?? ""]
        ))
        attributedString.append(NSAttributedString(
            string: descripton,
            attributes: [NSAttributedString.Key.font: UIFont(name: Constants.verdana, size: 10) ?? ""]
        ))
        attributedString.append(NSAttributedString(
            string: additionalText ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.font: UIFont(name: Constants.verdana, size: 10) ?? ""
            ]
        ))
        attributedText = attributedString
    }
}
