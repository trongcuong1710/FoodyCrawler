//
//  CSVExportService.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/19/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation

class CSVExportService: ExportService {
  private var filename = "foody.csv"
  private var items = [Exportable]()

  func export(items: [Exportable]) {
    NSLog("Exporting Foody Items")

    self.items = items
    let desktopDirectoryPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
    let path = URL(fileURLWithPath: desktopDirectoryPath).appendingPathComponent(filename)

    export(path: path)
  }

  private func export(path: URL) {
    var csvContent = "Name,Address,Latitude,Longitude,City,Category\n"

    for item in items {
      let newLine = "\"\(item.name)\",\"\(item.address)\",\(item.latitude),\(item.longitude),\(item.city),\(item.category)\n"
      csvContent.append(newLine)
    }

    do {
      try csvContent.write(to: path, atomically: true, encoding: .utf8)
      NSLog("Export Successfully!!!")
    } catch {
      NSLog("Export failed with error: \(error.localizedDescription)")
    }
  }
}
