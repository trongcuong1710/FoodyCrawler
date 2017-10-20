//
//  PlacesList.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy

struct PlacesList: JSONDecodable {
  let total: Int
  var items = [PlaceItem]()

  init(json: JSON) throws {
    total = try json.getInt(at: "Total")
    items = try json.decodedArray(at: "Items")
  }
}
