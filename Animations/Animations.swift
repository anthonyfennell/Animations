//
//  Animations.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import Foundation
import UIKit

struct Animations {
    
    // MARK: - Rotate at 45 degrees
    static func rotate360(squareView: UIView, anchorPoint: CGPoint, xAxis: CGFloat, yAxis: CGFloat, duration: CFTimeInterval = 4.0) {
        let transform = squareView.layer.transform
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, 0, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi, xAxis, yAxis, 0),
            CATransform3DRotate(transform, 3 * .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, 2 * .pi, xAxis, yAxis, 0)
        ]
        squareView.layer.anchorPoint = anchorPoint
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = duration
        animation.repeatCount = MAXFLOAT
        animation.values = values
        squareView.layer.add(animation, forKey: "tranformME")
    }
    
    static func rotate180AndBack(squareView: UIView, anchorPoint: CGPoint, xAxis: CGFloat, yAxis: CGFloat, duration: CFTimeInterval = 4.0) {
        let transform = squareView.layer.transform
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, 0, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, 0, xAxis, yAxis, 0)
        ]
        squareView.layer.anchorPoint = anchorPoint
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = duration
        animation.repeatCount = MAXFLOAT
        animation.values = values
        squareView.layer.add(animation, forKey: "tranformME")
    }
    
    // MARK: - Helper methods for 4 square fans
    static func animateAsFan(container: SquaresContainer) {
        for square in container.views {
            animateView(view: square.view, position: square.position, center: container.center, rotation: container.rotation)
        }
    }
    
    static func animateView(view: UIView, position: SquarePosition, center: CGPoint, rotation: Rotation = .clockwise) {
        let startAngle = rotation == .clockwise ? position.startAngle() : position.endAngle()
        let endAngle = rotation == .clockwise ? position.endAngle() : position.startAngle()
        let circlePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: startAngle, endAngle: endAngle, clockwise: rotation == .clockwise)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        view.layer.add(animation, forKey: nil)
    }
}
