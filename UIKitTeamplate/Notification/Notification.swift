// Notification.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает структуру уведомления
struct Notification {
    /// Имя пользователя
    let userName: String
    /// Текст уведомления
    let title: String
    /// Изображения пользователя отправившего уведомление
    let avatarUserImageName: String
    /// Время отправки уведомления
    let time: String
    /// Название изображения поста
    let postImageName: String?
    /// Упоминание пользователя
    let isMentioned: Bool
    /// Связано ли уведомление с публикацией
    var isPostNotification: Bool {
        postImageName == nil
    }
}
