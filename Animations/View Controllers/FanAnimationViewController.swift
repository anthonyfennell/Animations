//
//  FanAnimationViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class FanAnimationViewController: SquareViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fan"
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addFanAnimations()
    }
    
    override func goToNextScreen() {
        self.navigationController?.pushViewController(ViewControllerFactory.makeLinearLoadingVC(), animated: true)
    }
    
    // MARK: - Square fans
    func addFanAnimations() {
        let valueX: CGFloat = 60
        let valueY: CGFloat = 60
        addSquareAndAnimate(center: view.center, rotation: .counterClockwise)
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX, y: view.center.y - valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX, y: view.center.y + valueY))
        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX, y: view.center.y - valueY))
        
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y), rotation: .counterClockwise)
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y), rotation: .counterClockwise)
//        
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y + valueY))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y + valueY))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y - valueY))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y - valueY))
//        
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y + valueY * 2), rotation: .counterClockwise)
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 2, y: view.center.y - valueY * 2), rotation: .counterClockwise)
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y + valueY * 2), rotation: .counterClockwise)
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 2, y: view.center.y - valueY * 2), rotation: .counterClockwise)
//        
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y + valueY * 3))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x + valueX * 3, y: view.center.y - valueY * 3))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y + valueY * 3))
//        addSquareAndAnimate(center: CGPoint(x: view.center.x - valueX * 3, y: view.center.y - valueY * 3))
    }
    


}
