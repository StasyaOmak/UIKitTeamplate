// Stories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описание структуры историй
struct Stories {
    /// Имя пользователя в истории
    var userName: String
    /// Название изображения аватара пользователя
    var imageName: String
    /// Показывает это история владельца аккаунта или подписок
    let isSelfStory: Bool
}
