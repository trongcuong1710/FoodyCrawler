//
//  ParseHelper.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Alamofire

struct ParseHelper {
  static func parse<T>(with parser: () throws -> Result<T>) -> Result<T> {
    do {
      return try parser()
    } catch let error{
      return .failure(ParseError(reason: "Failed to parse response with error: \(error.localizedDescription)"))
    }
  }
}

struct ParseError: Error {
  private(set) var localizedDescription: String

  init(reason: String) {
    localizedDescription = reason
  }
}
