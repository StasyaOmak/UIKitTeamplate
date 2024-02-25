// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описывает структуру поста
struct Post {
    /// Имя владельца поста
    let userName: String
    /// Автар владельца поста
    let userAvatarImageName: String
    /// Название картинок поста
    let postImageNames: [String]
    /// Количество лайков
    let likes: Int
    /// Подпись поста
    let postTitle: String
    /// Изображение пользователя для комментария
    let loginUserAvatarImageName: String
}
