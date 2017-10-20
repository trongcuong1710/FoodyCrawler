//
//  CityComboBox.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/20/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Cocoa

class CityComboBox: NSComboBox, NSComboBoxDataSource {
  private var matchedIndex = -1
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  private func commonInit() {
    usesDataSource = true
    dataSource = self
    numberOfVisibleItems = 10
    completes = true
  }

  func numberOfItems(in comboBox: NSComboBox) -> Int {
    return Cities.allCities.count
  }

  func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
    let city = Cities.allCities[index]
    return city.displayName
  }

  func comboBox(_ comboBox: NSComboBox, completedString string: String) -> String? {
    let matchedCity = Cities.allCities.first(where: { $0.name.lowercased().hasPrefix(string.lowercased()) } )

    if let matchedCity = matchedCity {
      matchedIndex = Cities.allCities.index(of: matchedCity)!
      return matchedCity.displayName
    }

    matchedIndex = -1
    return nil
  }

  func comboBox(_ comboBox: NSComboBox, indexOfItemWithStringValue string: String) -> Int {
    return Cities.allCities.index(where: { $0.displayName == string }) ?? -1
  }

  override func keyUp(with event: NSEvent) {
    if Int(event.keyCode) == NSEnterCharacter || Int(event.keyCode) == NSCarriageReturnCharacter, matchedIndex != -1 {
      selectItem(at: matchedIndex)
    }

    super.keyUp(with: event)
  }
}
