//
//  ViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 4/18/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        let barItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(goToNextScreen))
        self.navigationItem.rightBarButtonItem = barItem
    }
    
    @objc func goToNextScreen() {
    
    }

}

