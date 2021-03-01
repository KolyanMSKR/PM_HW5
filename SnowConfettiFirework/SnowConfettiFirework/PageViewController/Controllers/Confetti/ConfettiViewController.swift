//
//  ConfettiViewController.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

class ConfettiViewController: UIViewController {

    // MARK: - Properties
    private var confettiView: ConfettiView!

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Happy Birthday!"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 40, weight: .regular)

        return label
    }()

    private let birthdayCakeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "birthday-cake")

        return imageView
    }()

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        setupBackgroundGradient()

        view.addSubview(titleLabel)
        view.addSubview(birthdayCakeImageView)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),

            birthdayCakeImageView.heightAnchor.constraint(equalToConstant: 160),
            birthdayCakeImageView.widthAnchor.constraint(equalTo: birthdayCakeImageView.heightAnchor, multiplier: 1),
            birthdayCakeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            birthdayCakeImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])

        setupConfetti()
    }

    private func setupConfetti() {
        confettiView = ConfettiView(frame: self.view.bounds)
        confettiView.colors = [.red, .green, .blue]

        view.addSubview(confettiView)
        confettiView.setupConfetti()
        confettiView.clipsToBounds = true
    }

    private func setupBackgroundGradient() {
        let firstColor = UIColor(red: 0.5, green: 0.85, blue: 1.0, alpha: 1).cgColor
        let secondColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1).cgColor
        view.setGradient(with: [firstColor, secondColor])
    }

}
