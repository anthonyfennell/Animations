//
//  Delay.swift
//  Animations
//
//  Created by Anthony Fennell on 12/21/19.
//  Copyright © 2019 Anthony Fennell. All rights reserved.
//

import Foundation

func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
