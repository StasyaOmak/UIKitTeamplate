// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Класс для воспроизведения треков
final class PlayerViewController: UIViewController {
    // MARK: - Public Properties

    var index = 0

    // MARK: - Private Properties

    private let musicAlbum: [Album] = [
        Album(song: "lorean", image: "Lorean", nameSong: "Tattoo", nameArtist: "Lorean", time: "03:03"),
        Album(
            song: "stromae",
            image: "stromae",
            nameSong: "Formidable",
            nameArtist: "Stromae",
            time: "03:34"
        ),
        Album(song: "aigel", image: "Aigel", nameSong: "Пыяла", nameArtist: "Aigel", time: "03:31"),
    ]
    private var timer: Timer?
    private var player = AVAudioPlayer()

    // MARK: - IBOutlets

    @IBOutlet private var singerLabel: UILabel!
    @IBOutlet private var nameSongLabel: UILabel!
    @IBOutlet private var nameImageView: UIImageView!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var favoriteButton: UISlider!
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var rewindSlider: UISlider!
    @IBOutlet private var soundButton: UIButton!
    @IBOutlet private var timeSongLabel: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAudioPlayer()
        setupPlayer()
        timeSongLabel.text = "00: 00"
        nameSongLabel.textColor = .white
        singerLabel.textColor = .white
    }

    // MARK: - Private Methods

    // перемотка музыки
    private func setupPlayer() {
        singerLabel.text = musicAlbum[index].nameArtist
        nameSongLabel.text = musicAlbum[index].nameSong
        nameImageView.image = UIImage(named: musicAlbum[index].image)
        favoriteButton.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        slider.transform = CGAffineTransformMakeRotation(CGFloat(-Double.pi / 2))
    }

    private func initializeAudioPlayer() {
        do {
            if let audioPath = Bundle.main.path(forResource: musicAlbum[index].song, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                favoriteButton.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }

        timer = Timer.scheduledTimer(
            timeInterval: 0.0001,
            target: self,
            selector: #selector(updateTimeSong),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - IBAction

    // метод включения выключения музыки

    @IBAction private func togglePlayButton(_ sender: Any) {
        if playButton.currentImage == UIImage(named: "play") {
            playButton.setImage(UIImage(named: "stop"), for: .normal)
            player.play()

        } else {
            playButton.setImage(UIImage(named: "play"), for: .normal)
            player.stop()
        }
    }

    // следующая песня
    @IBAction private func playNextSong(_ sender: Any) {
        player.stop()
        if index < (musicAlbum.count - 1) {
            index += 1
            singerLabel.text = musicAlbum[index].nameArtist
            nameSongLabel.text = musicAlbum[index].nameSong
            nameImageView.image = UIImage(named: musicAlbum[index].image)
        } else {
            index = 0
        }
        initializeAudioPlayer()
        player.play()
    }

    // предыдущая песня
    @IBAction private func playPreviousSong(_ sender: Any) {
        player.stop()
        if index != 0 {
            index -= 1
            singerLabel.text = musicAlbum[index].nameArtist
            nameSongLabel.text = musicAlbum[index].nameSong
            nameImageView.image = UIImage(named: musicAlbum[index].image)
        } else {
            index = (musicAlbum.count - 1)
        }
        initializeAudioPlayer()
        player.play()
    }

    // громкость
    @IBAction private func adjustVolume(_ sender: Any) {
        if slider.value == 0 {
            soundButton.setImage(UIImage(named: "mute"), for: .normal)
        } else {
            soundButton.setImage(UIImage(named: "sound"), for: .normal)
        }
        player.volume = slider.value
    }

    // перемотка песни
    @IBAction private func adjustRewindSlider(_ sender: Any) {
        rewindSlider.maximumValue = Float(player.duration)
    }

    // Открытие алертконтроллера
    @IBAction private func openPlaylistButton(_ sender: Any) {
        let playlistAlert = UIAlertController(
            title: "",
            message: "",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ок", style: .cancel)

        playlistAlert.addAction(okAction)
        present(playlistAlert, animated: true)
    }

    // закрыть экран
    @IBAction private func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }

    // включить и выключить звук
    @IBAction private func toggleSound(_ sender: Any) {
        if soundButton.currentImage == UIImage(named: "sound") {
            soundButton.setImage(UIImage(named: "mute"), for: .normal)
            player.volume = 0
            slider.value = 0
        } else {
            soundButton.setImage(UIImage(named: "sound"), for: .normal)
            player.volume = 0.1
            slider.value = 0.1
        }
    }

    @IBAction private func updateTimeSong(_ sender: Any) {
        let time = Int(player.duration) - Int(player.currentTime)
        let minets = time / 60
        let second = time % 60
        timeSongLabel.text = NSString(format: "-%02d:%02d", minets, second) as String
        rewindSlider.value = Float(player.currentTime)
    }

    @objc private func changeSlider(sender: UISlider) {
        if sender == favoriteButton {
            player.currentTime = TimeInterval(sender.value)
        }
    }
}
