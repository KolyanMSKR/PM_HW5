//
//  ConfettiView.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

class ConfettiView: UIView {
    
    public var colors: [UIColor]!

    private var emitter: CAEmitterLayer!

    public func setupConfetti() {
        emitter = CAEmitterLayer()

        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)

        var cells = [CAEmitterCell]()
        for color in colors {
            cells.append(confetti(with: color))
        }

        emitter.emitterCells = cells
        layer.addSublayer(emitter)
    }

    private func confetti(with color: UIColor) -> CAEmitterCell {
        let confettiEmitterCell = CAEmitterCell()
        confettiEmitterCell.contents = UIImage(named: "confetti")?.cgImage
        confettiEmitterCell.birthRate = 10
        confettiEmitterCell.lifetime = 20
        confettiEmitterCell.lifetimeRange = 0
        confettiEmitterCell.color = color.cgColor
        confettiEmitterCell.velocity = 300
        confettiEmitterCell.velocityRange = 80
        confettiEmitterCell.emissionLongitude = .pi
        confettiEmitterCell.emissionRange = .pi
        confettiEmitterCell.spin = 3
        confettiEmitterCell.spinRange = 4
        confettiEmitterCell.scaleRange = 0.8
        confettiEmitterCell.scaleSpeed = -0.1

        return confettiEmitterCell
    }

}
