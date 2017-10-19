//
//  FoodyService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Alamofire

protocol FoodyService {
  typealias CrawlCallback = (Result<[PlaceItem]>) -> Void
  
  var city: Cities { get }
  var category: Categories { get }
  var items: [PlaceItem] { get }

  init(foodyAuthUDID: String, foodyAuth: String, city: Cities, category: Categories)
  func crawl(callback: @escaping CrawlCallback)
}
