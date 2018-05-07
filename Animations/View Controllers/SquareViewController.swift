//
//  SquareViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class SquareViewController: ViewController {

    var containers = [SquaresContainer]()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeContainers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        removeContainers()
    }
    
    func removeContainers() {
        for container in containers {
            for squareView in container.views {
                squareView.view.removeFromSuperview()
            }
        }
        containers.removeAll()
    }
    
    func addSquareAndAnimate(center: CGPoint, rotation: Rotation = .clockwise) {
        let container = addSquaresTo(center: center, rotation: rotation)
        containers.append(container)
        Animations.animateAsFan(container: container)
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

}
