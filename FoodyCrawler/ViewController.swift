//
//  ViewController.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/17/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  @IBOutlet fileprivate weak var button: NSButton!
  @IBOutlet fileprivate weak var foodyAuthUDIDTextField: NSTextField!
  @IBOutlet fileprivate weak var foodyAuthTextField: NSTextField!

  private var service: ApplicationService = DefaultApplicationService()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    button.target = self
    button.action = #selector(crawl)
  }

  func crawl() {
    let udid = foodyAuthUDIDTextField.stringValue
    let auth = foodyAuthTextField.stringValue

    if udid.isEmpty || auth.isEmpty {
      showError(title: "Argument Missing!!!", message: "You must provide UDID and Auth!!!")
      return
    }

    service.crawl(foodyAuthUDID: udid, foodyAuth: auth) { _ in }
  }
}

extension NSViewController {
  func showError(title: String, message: String) {
    let alert = NSAlert()
    alert.messageText = title
    alert.informativeText = message
    alert.addButton(withTitle: "OK")
    alert.alertStyle = .warning

    alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
  }
}
