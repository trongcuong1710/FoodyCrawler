//
//  Int+Random.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/19/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation

extension Int {
  static func random(range: ClosedRange<Int> ) -> Int {
    var offset = 0

    if range.lowerBound < 0 {
      offset = abs(range.lowerBound)
    }

    let mini = UInt32(range.lowerBound + offset)
    let maxi = UInt32(range.upperBound   + offset)

    return Int(mini + arc4random_uniform(maxi - mini)) - offset
  }
}
