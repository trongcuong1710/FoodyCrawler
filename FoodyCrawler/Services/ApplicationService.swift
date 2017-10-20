//
//  ApplicationService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/19/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Alamofire

protocol ApplicationService {
  typealias Callback = (Result<Bool>) -> ()

  func crawl(foodyAuthUDID: String, foodyAuth: String, city: Cities, callback: @escaping Callback)
}
