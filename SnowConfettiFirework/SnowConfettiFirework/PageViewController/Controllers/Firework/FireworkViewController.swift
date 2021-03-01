//
//  FireworkViewController.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

class FireworkViewController: UIViewController {

    // MARK: - Properties
    private var emitter: CAEmitterLayer!

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        let colors = [UIColor.black.cgColor, UIColor.blue.cgColor]
        view.setGradient(with: colors)

        setEmitter()
    }

    private func setEmitter() {
        emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: view.center.x, y: view.frame.size.height)

        let mainCell = CAEmitterCell()
        mainCell.contents = UIImage(named: "bokeh")?.cgImage
        mainCell.redRange = 1
        mainCell.greenRange = 1
        mainCell.blueRange = 1
        mainCell.emissionLongitude = -90.0 * (.pi / 180.0)
        mainCell.emissionRange = 10 * (.pi / 180.0)
        mainCell.birthRate = 1
        mainCell.lifetime = 2.5
        mainCell.velocity = 400.0
        mainCell.velocityRange = 70
        mainCell.yAcceleration = 1.0
        mainCell.spin = .pi / 180.0
        mainCell.scale = 0.01

        let tailCell = CAEmitterCell()
        tailCell.contents = UIImage(named: "spark")?.cgImage
        tailCell.birthRate = 300.0
        tailCell.lifetime = 0.5
        tailCell.duration = 1.23
        tailCell.velocity = 140.0
        tailCell.velocityRange = 120.0
        tailCell.xAcceleration = 120.0
        tailCell.yAcceleration = 400.0
        tailCell.scaleSpeed = 1
        tailCell.alphaSpeed = -2

        let fireworkCell = CAEmitterCell()
        fireworkCell.contents = UIImage(named: "tspark")?.cgImage
        fireworkCell.birthRate = 15000.0
        fireworkCell.lifetime = 13.0
        fireworkCell.beginTime = 1.3
        fireworkCell.duration = 0.03
        fireworkCell.velocity = 100.0
        fireworkCell.yAcceleration = 0.5
        fireworkCell.emissionRange = 360.0 * (.pi / 180.0)
        fireworkCell.spin = 124.6 * (.pi / 180.0)
        fireworkCell.scaleSpeed = 1
        fireworkCell.alphaSpeed = -1

        mainCell.emitterCells = [tailCell, fireworkCell]
        emitter.emitterCells = [mainCell]
        view.layer.addSublayer(emitter)
    }
    
}
