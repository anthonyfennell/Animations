//
//  BlobAnimationViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class BlobAnimationViewController: SquareViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Blob"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSquareAnimations()
    }
    
    override func goToNextScreen() {
        let squareAnimationVC = ViewControllerFactory.makeSquareAnimationVC()
        self.navigationController?.pushViewController(squareAnimationVC, animated: true)
    }
    
    // MARK: - Many fans
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

}
