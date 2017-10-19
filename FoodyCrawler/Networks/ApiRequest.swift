//
//  ApiRequest.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy
import Alamofire

protocol RequestInfo {
  var requestURL: URL { get }
  var params: [String: Any] { get }
  var headers: [String: String] { get }
  var httpMethod: Alamofire.HTTPMethod { get }
}

protocol ResponseParser {
  associatedtype ResultType
  typealias ParseResult = Result<ResultType>
  static func parse(payload: JSON) -> Result<ResultType>
}

protocol ApiRequest {
  associatedtype RequestInfoType: RequestInfo
  associatedtype ResponseParserType: ResponseParser
  typealias ApiResult = Result<ResponseParserType.ResultType>
  typealias ApiResultCallback = (ApiResult) -> Void

  func execute(_ info: RequestInfo, callback: @escaping ApiResultCallback)
}

class BaseApiRequest<T: RequestInfo, V: ResponseParser>: ApiRequest {
  typealias RequestInfoType = T
  typealias ResponseParserType = V

  private var request: DataRequest?

  func execute(_ info: RequestInfo, callback: @escaping ApiResultCallback) {
    if let request = request {
      request.cancel()
    }

    request = Alamofire.request(info.requestURL.absoluteString, method: info.httpMethod, parameters: info.params, headers: info.headers)
    request?.responseData { response in
      switch response.result {
      case .success(let data):
        self.parseData(data: data, withCallback: callback)
      case .failure(let error):
        callback(.failure(error))
      }
    }
  }

  private func parseData(data: Data, withCallback callback: ApiResultCallback) {
    let jsonResult = ParseHelper.parse { _ -> Result<JSON> in
      let json = try JSON(data: data)
      return Result.success(json)
    }

    switch jsonResult {
    case .failure(let error):
      callback(.failure(error))
    case .success(let json):
      callback(ResponseParserType.parse(payload: json))
    }
  }
}
