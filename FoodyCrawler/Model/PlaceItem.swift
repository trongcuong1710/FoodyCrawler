//
//  PlaceItem.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy

struct PlaceItem: JSONDecodable, Exportable {
  let name: String
  let address: String
  let lat: Double
  let lng: Double
  private(set) var city = ""
  private(set) var category = ""

  var latitude: String {
    return "\(lat)"
  }

  var longitude: String {
    return "\(lng)"
  }

  init(json: JSON) throws {
    name = try json.getString(at: "Name")
    address = try json.getString(at: "Address")
    lat = (try? json.getDouble(at: "Latitude")) ?? 0
    lng = (try? json.getDouble(at: "Longitude")) ?? 0
  }

  mutating func setCity(_ city: String) {
    self.city = city
  }

  mutating func setCategory(_ category: String) {
    self.category = category
  }
}
