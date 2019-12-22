//
//  SquareAnimationViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class SquareAnimationViewController: ViewController {

    let tealColor = UIColor(red: 90/255.0, green: 187/255.0, blue: 163/255.0, alpha: 1.0)
    let magentaColor = UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Squares"
        addThreeSquaresThatOverLapOnAnimate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func goToNextScreen() {
        self.navigationController?.pushViewController(ViewControllerFactory.makeAnimationTableVC(), animated: true)
    }
    
    // MARK: - Overlap Square Animation
    func addThreeSquaresThatOverLapOnAnimate() {
        addSquareAnimateAnchorTopRight(.pi / 2)
        addSquareAnimateAnchorMiddle()
        //addSquareAnimateAnchorBottomLeftCorner()
    }
    
    func addSquareAnimateAnchorTopRight(_ fromValue: CGFloat = 0) {
        let squareView = getHalvedSquare(width: 125, xOffset: 0, yOffset: -125, topColor: magentaColor, bottomColor: tealColor)
        self.view.addSubview(squareView)
        let anchorPoint = CGPoint(x: 1, y: 0)
        Animations.rotate360(squareView: squareView, anchorPoint: anchorPoint, xAxis: -1, yAxis: -1, fromValue: fromValue)
    }
    
    func addSquareAnimateAnchorMiddle() {
        let squareView = getFourSquare(width: 125, xOffset: 0, yOffset: 0, colorA: tealColor, colorB: magentaColor)
        self.view.addSubview(squareView)
        let anchorPoint = CGPoint(x: 0.5, y: 0.5)
        Animations.rotate360(squareView: squareView, anchorPoint: anchorPoint, xAxis: -1, yAxis: -1, duration: 4.0)
    }
    
    func addSquareAnimateAnchorBottomLeftCorner() {
        let squareView = getHalvedSquare(width: 125, xOffset: 0, yOffset: 125, topColor: tealColor, bottomColor: magentaColor)
        self.view.addSubview(squareView)
        let anchorPoint = CGPoint(x: 0, y: 1)
        Animations.rotate360(squareView: squareView, anchorPoint: anchorPoint, xAxis: 1, yAxis: 1)
    }
    
    // MARK: - Create halved square
    func getHalvedSquare(width: CGFloat, xOffset: CGFloat, yOffset: CGFloat, topColor: UIColor, bottomColor: UIColor) -> UIView {
        let pointX = view.center.x - width / 2 + xOffset
        let pointY = view.center.y - width / 2 + yOffset
        let aView = UIView(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        let subViewA = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width / 2))
        subViewA.backgroundColor = topColor
        let subViewB = UIView(frame: CGRect(x: 0, y: width / 2 , width: width, height: width / 2))
        subViewB.backgroundColor = bottomColor
        aView.addSubview(subViewA)
        aView.addSubview(subViewB)
        return aView
    }
    
    // MARK: - Create four block square
    func getFourSquare(width: CGFloat, xOffset: CGFloat, yOffset: CGFloat, colorA: UIColor, colorB: UIColor) -> UIView {
        let halfWidth = width / 2
        let pointX = view.center.x - width / 2 + xOffset
        let pointY = view.center.y - width / 2 + yOffset
        let aView = UIView(frame: CGRect(x: pointX, y: pointY, width: width, height: width))
        // Top
        let subViewTL = UIView(frame: CGRect(x: 0, y: 0, width: halfWidth, height: halfWidth))
        subViewTL.backgroundColor = colorA
        let subViewTR = UIView(frame: CGRect(x: halfWidth, y: 0, width: halfWidth, height: halfWidth))
        subViewTR.backgroundColor = colorB
        // Bottom
        let subViewBL = UIView(frame: CGRect(x: 0, y: halfWidth, width: halfWidth, height: halfWidth))
        subViewBL.backgroundColor = colorB
        let subViewBR = UIView(frame: CGRect(x: halfWidth, y: halfWidth, width: halfWidth, height: halfWidth))
        subViewBR.backgroundColor = colorA
        // Add views
        aView.addSubview(subViewTL)
        aView.addSubview(subViewTR)
        aView.addSubview(subViewBL)
        aView.addSubview(subViewBR)
        return aView
    }

}
