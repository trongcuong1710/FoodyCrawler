//
//  FoodyApiRequest.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy
import Alamofire

struct FoodyRequestInfo: RequestInfo {
  private var city: Cities
  private var category: Categories
  private var page: Int
  private var count: Int
  private var udid: String
  private var auth: String

  var requestURL: URL {
    var urlString = "https://www.foody.vn/__get/Place/HomeListPlace?"
    urlString += "t=\(Date().timeIntervalSince1970)"
    urlString += "&page=\(self.page)"
    urlString += "&count=\(self.count)"
    urlString += "&districtId="
    urlString += "&cateId="
    urlString += "&cuisineId="
    urlString += "&iReputation="
    urlString += "&type=1"

    return URL(string: urlString)!
  }

  var params: [String: Any] {
    return [:]
  }

  var headers: [String: String] {
    return buildHeaders()
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  init(city: Cities, category: Categories,page: Int, count: Int, udid: String, auth: String) {
    self.city = city
    self.category = category
    self.page = page
    self.count = count
    self.udid = udid
    self.auth = auth
  }

  private func buildHeaders() -> [String: String] {
    return ["Host": "www.foody.vn",
            "keep-alive": "Connection",
            "Upgrade-Insecure-Requests": "1",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36",
            "Accept": "application/json, text/plain, */*",
            "Referer": "https://www.foody.vn",
            "Accept-Encoding": "gzip, deflate, br",
            "Accept-Language": "en-US,en;q=0.8,vi;q=0.6",
            "X-Requested-With": "XMLHttpRequest",
            "Cookie": "FOODY.AUTH=\(auth); FOODY.AUTH.UDID=\(udid); gcat=\(category.rawValue); floc=\(city.rawValue)"]
  }
}

struct FoodyResponseParser: ResponseParser {
  typealias ResultType = PlacesList

  static func parse(payload: JSON) -> Result<PlacesList> {
    return ParseHelper.parse {
      let placesList = try PlacesList(json: payload)
      return .success(placesList)
    }
  }
}

class FoodyApiRequest: BaseApiRequest<FoodyRequestInfo, FoodyResponseParser> {}
