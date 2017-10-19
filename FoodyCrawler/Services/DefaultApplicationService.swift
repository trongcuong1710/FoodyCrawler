//
//  DefaultApplicationService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/19/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Alamofire

class DefaultApplicationService: ApplicationService {
  private var foodyAuthUDID = ""
  private var foodyAuth = ""
  private var currentIndex = 0
  private var items = [PlaceItem]()
  private let exportService: ExportService

  init(exportService: ExportService = CSVExportService()) {
    self.exportService = exportService
  }

  private(set) lazy var foodyServices: [FoodyService] = {
    return [FoodyFoodAtBinhDuongService(foodyAuthUDID: self.foodyAuthUDID, foodyAuth: self.foodyAuth)]
  }()

  func crawl(foodyAuthUDID: String, foodyAuth: String, callback: @escaping Callback) {
    self.foodyAuthUDID = foodyAuthUDID
    self.foodyAuth = foodyAuth

    let service = foodyServices[currentIndex]
    service.crawl { [weak self] result in
      guard let `self` = self else { return }
      self.foodyServiceCrawlingCallback(result: result, callback: callback)
    }
  }

  private func foodyServiceCrawlingCallback(result: Result<[PlaceItem]>, callback: @escaping Callback) {
    switch result {
    case .failure(let error):
      callback(.failure(error))
    case .success(let items):
      self.items.append(contentsOf: items)

      currentIndex += 1
      if currentIndex <= foodyServices.count - 1 {
        crawl(foodyAuthUDID: foodyAuthUDID, foodyAuth: foodyAuth, callback: callback)
      } else {
        exportService.export(items: self.items)
        callback(.success(true))
      }
    }
  }
}
