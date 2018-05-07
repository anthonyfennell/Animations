//
//  ViewControllerFactory.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func makeBlobAnimationVC() -> BlobAnimationViewController {
        let viewController = BlobAnimationViewController()
        return viewController
    }
    
    static func makeSquareAnimationVC() -> SquareAnimationViewController {
        let viewController = SquareAnimationViewController()
        return viewController
    }
    
    static func makePizzaAnimationVC() -> PizzaAnimationViewController {
        let viewController = PizzaAnimationViewController()
        return viewController
    }

}
