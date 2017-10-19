//
//  Queue.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation

class Queue<T> {
  private var stack = [T]()

  func enqueue(item: T) {
    stack.append(item)
  }

  func dequeue() -> T? {
    let item = stack.first

    if let item = item {
      stack.remove(at: 0)
    }

    return item
  }
}
