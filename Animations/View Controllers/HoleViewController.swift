//
//  HoleViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 4/4/19.
//  Copyright © 2019 Anthony Fennell. All rights reserved.
//

import UIKit

// A delay function
func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

enum ColorHex: Int, CaseIterable {
    case white1=0xFFFFFF, gray1=0xD1D1D1, gray2=0xABAAAA, gray3 = 0x848484
    case black1=0x535353, black2=0x272626
    
    public var color: UIColor {
        return UIColor(hex: self.rawValue)
    }
    
    public var string: String {
        return "\(self.rawValue)"
    }
}

class HoleViewController: ViewController {
    
    let radius: CGFloat = 3.0
    var currentColor: ColorHex = .white1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.beginAnimations(colorHex: self.currentColor)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            self.nextColor()
            self.beginAnimations(colorHex: self.currentColor)
        }
    }
    
    override func goToNextScreen() {
        self.navigationController?.pushViewController(ViewControllerFactory.makeBlobAnimationVC(), animated: true)
    }
    
    func nextColor() {
        switch self.currentColor {
        case .white1:
            self.currentColor = .gray1
        case .gray1:
            self.currentColor = .gray2
        case .gray2:
            self.currentColor = .gray3
        case .gray3:
            self.currentColor = .black1
        case .black1:
            self.currentColor = .black2
        case .black2:
            self.currentColor = .white1
        }
    }
    
    // Circles expanding in size to a largest size, that is faded out
    //
    // Fade in
    // May be able to do one animation that is moved outward
    // Then at the end it's faded
    // Then removed from the view
    //
    // New layer animations will have to have a rotating color
    
    func beginAnimations(colorHex: ColorHex) {
        let layer1 = getCircleLayer()
        layer1.fillColor = colorHex.color.cgColor
        self.view.layer.addSublayer(layer1)
        fadeIn(layer: layer1, value: colorHex.string, delay: 0)
    }
    
    func fadeIn(layer: CAShapeLayer, value: String, delay: TimeInterval) {
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0.0
        fade.toValue = 1.0
        fade.duration = 0.2

        let expand: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expand.fromValue = getPath1()
        expand.toValue = getPath2()
        expand.beginTime = fade.beginTime + fade.duration
        expand.duration = 2.8
        
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 1.0
        fadeOut.toValue = 0.0
        fadeOut.beginTime = expand.beginTime + expand.duration - 1.0
        fadeOut.duration = 1.0
        
        let group = CAAnimationGroup()
        group.animations = [fade, expand, fadeOut]
        group.fillMode = .forwards
        group.duration = 3.0
        group.setValue(value, forKey: "animation")
        group.setValue(layer, forKey: "layer")
        group.delegate = self
        layer.add(group, forKey: nil)
    }
    
    func getPath1() -> CGPath {
        let bounds = CGRect(x: self.view.center.x - 0.5, y: self.view.center.y - 0.5, width: 1.0, height: 1.0)
        return UIBezierPath(ovalIn: bounds).cgPath
    }
    
    func getPath2() -> CGPath {
        let bounds = CGRect(x: self.view.center.x - 150, y: self.view.center.y - 150, width: 300, height: 300)
        return UIBezierPath(ovalIn: bounds).cgPath
    }
    
    func getCircleLayer() -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = getPath1()
        //layer.anchorPoint = CGPoint(x: self.view.center.x, y: self.view.center.y)
        //layer.frame = CGRect(x: self.view.center.x - radius, y: self.view.center.y - radius, width: radius * 2, height: radius * 2)
        //layer.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        return layer
    }

}

extension HoleViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let value = anim.value(forKey: "animation") as? String, let layer = anim.value(forKey: "layer") as? CAShapeLayer {
            layer.removeFromSuperlayer()
        }
    }
}
