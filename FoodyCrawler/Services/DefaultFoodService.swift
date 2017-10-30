//
//  FoodyFoodAtBinhDuongService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation

let MAX_RETRIES = 5

class DefaultFoodyService: FoodyService {
  let city: Cities
  let category: Categories

  private(set) var items = [PlaceItem]()
  private var itemsCount = 12
  private var totalPages = -1
  private var currentPage = 1
  private var retriesCount = 0
  private let foodyAuthUDID: String
  private let foodyAuth: String

  required init(foodyAuthUDID: String, foodyAuth: String, city: Cities, category: Categories) {
    self.foodyAuthUDID = foodyAuthUDID
    self.foodyAuth = foodyAuth
    self.city = city
    self.category = category
  }

  func crawl(callback: @escaping CrawlCallback) {
    NSLog("Crawling Foody with UDID: \(foodyAuthUDID), Auth: \(foodyAuth), City: \(city.name), Category: \(category.rawValue), Page: \(currentPage)")
    let request = FoodyApiRequest()
    let foodyRequestInfo = FoodyRequestInfo(city: city, category: category, page: currentPage, count: itemsCount, udid: foodyAuthUDID, auth: foodyAuth)

    request.execute(foodyRequestInfo) { [weak self] result in
      guard let `self` = self else { return }

      switch result {
      case .failure(let error):
        self.handleCrawlError(error, callback: callback)
      case .success(let placesList):
        self.handleCrawlSuccess(placesList, callback: callback)
      }
    }
  }

  private func handleCrawlError(_ error: Error, callback: @escaping CrawlCallback) {
    NSLog("Crawl Foody failed with error: \(error.localizedDescription)")
    retriesCount += 1

    if retriesCount <= MAX_RETRIES {
      let delayTime = Int.random(range: 5...10)
      NSLog("Will retry after: \(delayTime)")
      DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayTime)) {
        NSLog("Attemp to retry, count: \(self.retriesCount)")
        self.crawl(callback: callback)
      }
    } else {
      NSLog("Exceed maximum retry, please try again later!!!")
      callback(.failure(error))
    }
  }

  private func handleCrawlSuccess(_ placesList: PlacesList, callback: @escaping CrawlCallback) {
    NSLog("Crawl successfully!")
    append(placesList.items)

    if totalPages == -1 {
      let totalItem = placesList.total
      totalPages = Int(ceil(Double(totalItem) / Double(itemsCount)))
    }

    if currentPage < totalPages {
      currentPage += 1

      let delayTime = Int.random(range: 5...10)
      NSLog("Crawl next page after: \(delayTime)")
      DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayTime)) {
        self.crawl(callback: callback)
      }
    } else {
      callback(.success(items))
    }
  }

  private func append(_ items: [PlaceItem]) {
    let resultItems = items.map { item -> PlaceItem in
      var newItem = item
      newItem.setCity(city.name)
      newItem.setCategory(category.rawValue)
      return newItem
    }

    self.items.append(contentsOf: resultItems)
  }
}
