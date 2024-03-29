//
//  ExportService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/19/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Alamofire

protocol Exportable {
  var name: String { get }
  var address: String { get }
  var latitude: String { get }
  var longitude: String { get }
  var city: String { get }
  var category: String { get }
}

protocol ExportService {
  typealias ExportCallback = (Result<Bool>) -> Void
  func export(items: [Exportable], callback: @escaping ExportCallback)
}
