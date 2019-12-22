//
//  PizzaAnimationViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class PizzaAnimationViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza"
        addPizzaSlice()
    }
    
    override func goToNextScreen() {
        let viewController = ViewControllerFactory.makeSquareAnimationVC()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func addPizzaSlice() {
        let width: CGFloat = 150
        let pointX: CGFloat = 150
        let pointY: CGFloat = 150
        let pizza = Pizza(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        pizza.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        view.addSubview(pizza)
        // Transform
        let baseTransform = view.layer.transform
        let fromValue = CATransform3DRotate(baseTransform, -.pi / 8, 0, 0, 1)
        let toValue = CATransform3DRotate(fromValue, 2 * .pi, 1, 1, 0)
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.fromValue = fromValue
        animation.toValue = toValue
        pizza.layers.first?.add(animation, forKey: "tranformME")
    }
    
    // MARK: - Misc testing
    func addPizzaAnimationB() {
        let width: CGFloat = 250
        let pointX: CGFloat = 0
        let pointY: CGFloat = 0
        let pizza = Pizza(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        pizza.backgroundColor = UIColor.clear
        view.addSubview(pizza)
        // Transform
        let baseTransform = view.layer.transform
        let fromValue = CATransform3DRotate(baseTransform, -.pi / 8, 0, 0, 1)
        let toValue = CATransform3DRotate(fromValue, 2 * .pi, 1, 1, 0)
        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.fromValue = fromValue
        animation.toValue = toValue
        pizza.layer.add(animation, forKey: "tranformME")
    }
    
    // MARK: - Animation
    func addSliceAnimation() {
        let width: CGFloat = 125
        let pointX = view.center.x - width / 2
        let pointY = view.center.y - width / 2
        let slice = Slice(frame: CGRect(x: pointX, y: pointY, width: width, height: width / 2))
        slice.quadrant = .one
        view.addSubview(slice)
    }
    
    func addPizzaAnimation() {
        let width: CGFloat = 250
        let pointX = view.center.x - width / 2
        let pointY = view.center.y - width / 2
        let pizza = Pizza(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        view.addSubview(pizza)
        Animations.rotate360(squareView: pizza, anchorPoint: CGPoint(x: 0.5, y: 0.5), xAxis: 1.0, yAxis: 1.0)
    }

}
