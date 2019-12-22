//
//  LinearLoadingViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 12/21/19.
//  Copyright © 2019 Anthony Fennell. All rights reserved.
//

import UIKit

class LinearLoadingViewController: SquareViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.makeLoadingBarAt(y: 60, color: UIColor.purple)
        self.makeLoadingBarAt(y: 100, color: UIColor.orange)
        self.makeLoadingBarAt(y: 140, color: UIColor.black)
    }
    
    func makeLoadingBarAt(y: CGFloat, color: UIColor) {
        let padding: CGFloat = 20
        let height: CGFloat = 4
        let rect = CGRect(x: padding, y: y, width: self.view.frame.width - padding * 2, height: height)
        let bar = LinearLoadingBar(frame: rect)
        bar.animationColor = color
        self.view.addSubview(bar)
    }
    
    override func goToNextScreen() {
        self.navigationController?.pushViewController(ViewControllerFactory.makeSquareAnimationVC(), animated: true)
    }
}
