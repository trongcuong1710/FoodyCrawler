//
//  Cities.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy

enum Cities: Int {
  case BinhDuong = 230
  case VungTau = 223

  var name: String {
    switch self {
    case .BinhDuong:
      return "Bình Dương"
    case .VungTau:
      return "Vũng Tàu"
    }
  }
}
