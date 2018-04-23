//
//  ViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 4/18/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

enum Position {
    case left, right, top, bottom
}

enum Rotation {
    case clockwise, counterClockwise
}

struct SquareView {
    let position: Position
    let view: UIView
}

struct SquaresContainer {
    let center: CGPoint
    let rotation: Rotation
    let views: [SquareView]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        addSquareAnimations()
        //addPizzaAnimation()
        //addSliceAnimation()
        //addSquareAndAnimate(center: CGPoint(x: 70, y: 70))
        //addSquareToAnimate()
    }
    
    func addSquareToAnimate() {
        let width: CGFloat = 125
        let pointB = view.center.x - width / 2
        let pointY = view.center.y - width / 2
        let aView = UIView(frame: CGRect(x: pointB, y: pointY, width: width, height: width))
        self.view.addSubview(aView)
        rotateZAxis(view: aView)
    }
    
    
    func addSliceAnimation() {
        let width: CGFloat = 125
        let pointX = view.center.x - width / 2
        let pointY = view.center.y - width / 2
        let slice = Slice(frame: CGRect(x: pointX, y: pointY, width: width, height: width / 2))
        slice.quadrant = .one
        view.addSubview(slice)
        //rotateZAxis(view: slice)
    }
    
    func addPizzaAnimation() {
        let width: CGFloat = 250
        let pointX = view.center.x - width / 2
        let pointY = view.center.y - width / 2
        let pizza = Pizza(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        view.addSubview(pizza)
        rotateZAxis(view: pizza)
    }
    
    func rotateZAxis(view: UIView) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.fromValue = 0
        rotation.toValue = 1
        rotation.duration = 2.0
        rotation.isCumulative = true
        rotation.repeatCount = MAXFLOAT
        
        let rotationY : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotationY.fromValue = 0
        rotationY.toValue = 1
        rotationY.duration = 2.0
        rotationY.isCumulative = true
        rotationY.repeatCount = MAXFLOAT
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotationY, rotation]
        
        
        // Define anchor point
        
        view.backgroundColor = UIColor.yellow
        
        // Doing this now
        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        var transform = CATransform3DIdentity
        //transform.m34 = CGFloat(-1) / view.bounds.width
        //transform = CATransform3DRotate(transform, <How far to rotate>, <X Axis>, <Y Axis>, <Z Axis>)
        transform = CATransform3DRotate(transform, CGFloat.pi, 1, 1, 0)
        animation.toValue = transform
        view.layer.add(animation, forKey: "transform")
        
        
        
        //view.layer.add(animationGroup, forKey: "rotationY")
        
//        let animation = CABasicAnimation(keyPath: "transform")
//        animation.fromValue = view.layer.transform
//        animation.toValue = [CATransform3DMakeRotation(CGFloat.pi * 2, 0.5, 0.5, 0)]
//        animation.duration = 2.0
//        animation.repeatCount = MAXFLOAT
//        view.layer.add(animation, forKey: "transformXY")
    }
    
    func addStaticSquareAnimations() {
        let valueX: CGFloat = 50
        let valueY: CGFloat = 100
        addSquareAndAnimate(center: view.center, rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX, y: view.center.y - valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX, y: view.center.y - valueY))
        
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y), rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y), rotation: .counterClockwise)
        
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y - valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y - valueY))
        
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y + valueY * 2), rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y - valueY * 2), rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y + valueY * 2), rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y - valueY * 2), rotation: .counterClockwise)
        
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y + valueY * 3))
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y - valueY * 3))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y + valueY * 3))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y - valueY * 3))
    }
    
    func addSquareAnimations() {
        var valueX: CGFloat = view.center.x
        var valueY: CGFloat = view.center.y
        for _ in 0...100 {
            valueX = valueX - 1
            valueY = valueY - 1
            addSquareAndAnimate(center: CGPoint(x: valueX , y: valueY))
        }
        for _ in 0...100 {
            valueX = valueX + 1
            valueY = valueY - 1
            addSquareAndAnimate(center: CGPoint(x: valueX , y: valueY))
        }
        for _ in 0...100 {
            valueX = valueX + 1
            valueY = valueY + 1
            addSquareAndAnimate(center: CGPoint(x: valueX , y: valueY))
        }
        for _ in 0...70 {
            valueX = valueX - 1
            valueY = valueY + 1
            addSquareAndAnimate(center: CGPoint(x: valueX , y: valueY))
        }
    }
    
    func addSquareAndAnimate(center: CGPoint, rotation: Rotation = .clockwise) {
        let container = addSquaresTo(center: center, rotation: rotation)
        animate(container: container)
    }
    
    func addSquaresTo(center: CGPoint, rotation: Rotation = .clockwise) -> SquaresContainer {
        let leftView = addSquare(toPoint: CGPoint(x: center.x - 60, y: center.y - 15), color: UIColor.red)
        let rightView = addSquare(toPoint: CGPoint(x: center.x + 30, y: center.y - 15), color: UIColor.blue)
        let topView = addSquare(toPoint: CGPoint(x: center.x - 15, y: center.y + 30), color: UIColor.orange)
        let bottomView = addSquare(toPoint: CGPoint(x: center.x - 15, y: center.y - 60), color: UIColor.purple)
        let squareContainer = SquaresContainer(center: center, rotation: rotation, views: [SquareView(position: .left, view: leftView),
                                                                       SquareView(position: .right, view: rightView),
                                                                       SquareView(position: .bottom, view: bottomView),
                                                                       SquareView(position: .top, view: topView)])
        return squareContainer
    }
    
    func addSquare(toPoint point: CGPoint, color: UIColor) -> UIView {
        let frame = CGRect(x: point.x, y: point.y, width: 30, height: 30)
        let view = UIView(frame: frame)
        view.backgroundColor = color
        self.view.addSubview(view)
        return view
    }
    
    func animate(container: SquaresContainer) {
        for square in container.views {
            animateView(view: square.view, position: square.position, center: container.center, rotation: container.rotation)
        }
    }
    
    func animateView(view: UIView, position: Position, center: CGPoint, rotation: Rotation = .clockwise) {
        let startAngle = rotation == .clockwise ? startAngleFor(position: position) : endAngleFor(position: position)
        let endAngle = rotation == .clockwise ? endAngleFor(position: position) : startAngleFor(position: position)
        let circlePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: startAngle, endAngle: endAngle, clockwise: rotation == .clockwise)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        view.layer.add(animation, forKey: nil)
        //rotate(view: view)
    }
    
    func rotate(view: UIView, rotationType: Rotation = .clockwise) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        let fromValue = (rotationType == .clockwise) ? Double.pi * 2 : 0
        let toValue = (rotationType == .clockwise) ? 0 : -Double.pi * 2
        //let fromValue = Double.pi / 2
        //let toValue = Double.pi * 5 / 2
        rotation.fromValue = NSNumber(value: fromValue)
        rotation.toValue = NSNumber(value: toValue)
        rotation.duration = 2.0
        rotation.isCumulative = true
        rotation.repeatCount = MAXFLOAT
        view.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func animateOnVector() {
        
    }
    
    func startAngleFor(position: Position) -> CGFloat {
        switch position {
        case .top:
            return CGFloat.pi / 2
        case .left:
            return CGFloat.pi
        case .bottom:
            return CGFloat.pi * 3 / 2
        case .right:
            return 0
        }
    }
    
    func endAngleFor(position: Position) -> CGFloat {
        switch position {
        case .top:
            return CGFloat.pi * 5 / 2
        case .left:
            return CGFloat.pi * 3
        case .bottom:
            return CGFloat.pi * 7 / 2
        case .right:
            return CGFloat.pi * 2
        }
    }

}

