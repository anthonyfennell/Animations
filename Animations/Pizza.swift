//
//  Pizza.swift
//  Animations
//
//  Created by Anthony Fennell on 4/18/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

enum Quadrant: Int {
    case one, two, three, four, five, six, seven, eight
    
    func startAngle() -> CGFloat {
        return CGFloat.pi / 4 * CGFloat(self.rawValue)
    }
    
    func endAngle() -> CGFloat {
        return CGFloat.pi / 4 * CGFloat(self.rawValue + 1)
    }
}

class Pizza: UIView {
    
    var layers = [CAShapeLayer]()
    
    var arcRadius: CGFloat {
        return self.frame.width / 2
    }
    
    var pizzaCenter: CGPoint {
        return CGPoint(x: self.arcRadius, y: self.arcRadius)
    }

    override func draw(_ rect: CGRect) {
        UIColor.purple.set()
        addSliceLayer(quadrant: .one)
        self.setNeedsLayout()
//        addSliceLayer(quadrant: .two)
//        addSliceLayer(quadrant: .three)
//        addSliceLayer(quadrant: .four)
//        addSliceLayer(quadrant: .five)
//        addSliceLayer(quadrant: .six)
//        addSliceLayer(quadrant: .seven)
//        addSliceLayer(quadrant: .eight)
    }
    
    func addSliceLayer(quadrant: Quadrant) {
        let layer = CAShapeLayer()
        _ = getSlice(quadrant: quadrant)
        //self.layer.addSublayer(layer)
    
        
//        let animationX = getFlipAnimationX(quadrant: quadrant)
//        let animationY = getFlipAnimationY(quadrant: quadrant)
//        let animationGroup = CAAnimationGroup()
//        animationGroup.animations = [animationX, animationY]
//        animationGroup.repeatCount = MAXFLOAT
//        animationGroup.duration = 2.0
//        let pointX = arcRadius * cos(quadrant.endAngle() - quadrant.startAngle()) + arcRadius / 2
//        let pointY = arcRadius * sin(quadrant.endAngle() - quadrant.startAngle()) + arcRadius / 2
//        layer.anchorPoint = CGPoint(x: pointX, y: pointY)
//        layer.add(animationGroup, forKey: "blah")
        //addFlipAnimation3D(quadrant: quadrant, layer: layer)
        //layer.setNeedsLayout()
    }

    func getSlice(quadrant: Quadrant) -> CGPath {
        let path = UIBezierPath()
        let sPointX = arcRadius * cos(quadrant.startAngle()) + arcRadius
        let sPointY = arcRadius * sin(quadrant.startAngle()) + arcRadius
        let startPoint: CGPoint = CGPoint(x: sPointX, y: sPointY)
        path.lineWidth = 3.0
        path.move(to: startPoint)
        path.addArc(withCenter: pizzaCenter, radius: arcRadius, startAngle: quadrant.startAngle(), endAngle: quadrant.endAngle(), clockwise: true)
        path.addLine(to: pizzaCenter)
        path.fill()
        return path.cgPath
    }
    
    func getFlipAnimationY(quadrant: Quadrant) -> CABasicAnimation {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.fromValue = 0
        rotation.toValue = 1
        rotation.duration = 2.0
        rotation.isCumulative = true
        rotation.repeatCount = MAXFLOAT
        return rotation
    }
    
    func getFlipAnimationX(quadrant: Quadrant) -> CABasicAnimation {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = 1
        rotation.duration = 2.0
        rotation.isCumulative = true
        rotation.repeatCount = MAXFLOAT
        return rotation
    }
    
    func addFlipAnimation3D(quadrant: Quadrant, layer: CAShapeLayer) {
        let angle = quadrant.endAngle() - quadrant.startAngle() + CGFloat.pi / 2
        let transform = CATransform3DMakeRotation(angle, 0.5, 0.5, 0)
        layer.transform = transform
        return
//        let transform = CATransform3D()
//        transform.
//        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
//        rotation.fromValue = 0
//        rotation.toValue = 1
//        rotation.duration = 2.0
//        rotation.isCumulative = true
//        rotation.repeatCount = MAXFLOAT
//        return rotation
    }
    
    func addFlipAnimationPath(quadrant: Quadrant, layer: CAShapeLayer) {
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = CGFloat.pi * 2
        let circlePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        layer.add(animation, forKey: nil)
    }

}










