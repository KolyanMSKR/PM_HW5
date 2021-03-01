//
//  SnowViewController.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

class SnowViewController: UIViewController {

    // MARK: - Properties
    private var snowEmitterLayer: CAEmitterLayer!
    private var flakeEmitterCell: CAEmitterCell!
    private var isAnimating = false

    private let playStopAnimationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Make it snow!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        setupBackgroundGradient()
        setupFlake()
        snowEmitterLayer.isHidden = true
        playStopAnimationButton.addTarget(self, action: #selector(playStopAnimationButtonAction), for: .touchUpInside)

        view.addSubview(playStopAnimationButton)

        NSLayoutConstraint.activate([
            playStopAnimationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            playStopAnimationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playStopAnimationButton.heightAnchor.constraint(equalToConstant: 30),
            playStopAnimationButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }

    private func setupBackgroundGradient() {
        let firstColor = UIColor(red: 0.2, green: 0.3, blue: 0.6, alpha: 1).cgColor
        let secondColor = UIColor(red: 0.7, green: 0.8, blue: 0.9, alpha: 1).cgColor
        view.setGradient(with: [firstColor, secondColor])
    }

    private func setupFlake() {
        flakeEmitterCell = CAEmitterCell()
        flakeEmitterCell.contents = UIImage(named: "snow")?.cgImage
        flakeEmitterCell.scale = 0.2
        flakeEmitterCell.scaleRange = 0.3
        flakeEmitterCell.emissionRange = .pi
        flakeEmitterCell.lifetime = 20.0
        flakeEmitterCell.birthRate = 35
        flakeEmitterCell.velocity = 20
        flakeEmitterCell.velocityRange = -20
        flakeEmitterCell.yAcceleration = 30
        flakeEmitterCell.xAcceleration = 0
        flakeEmitterCell.spin = 20
        flakeEmitterCell.spinRange = 1.0

        snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [flakeEmitterCell]
        view.layer.addSublayer(snowEmitterLayer)
    }

    // MARK: - Actions
    @objc private func playStopAnimationButtonAction() {
        snowEmitterLayer.isHidden = isAnimating
        if isAnimating {
            playStopAnimationButton.setTitleColor(.systemBlue, for: .normal)
            playStopAnimationButton.setTitle("Make it snow!", for: .normal)
        } else {
            playStopAnimationButton.setTitleColor(.systemRed, for: .normal)
            playStopAnimationButton.setTitle("Make it stop!", for: .normal)
        }
        isAnimating.toggle()
    }
    
}
