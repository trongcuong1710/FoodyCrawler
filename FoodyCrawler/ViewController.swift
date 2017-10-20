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
  @IBOutlet fileprivate weak var cityComboBox: CityComboBox!

  private var service: ApplicationService = DefaultApplicationService()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    button.target = self
    button.action = #selector(crawl)
    foodyAuthUDIDTextField.becomeFirstResponder()
  }

  func crawl() {
    let udid = foodyAuthUDIDTextField.stringValue
    let auth = foodyAuthTextField.stringValue
    let cityComboBoxSelectedIndex = cityComboBox.indexOfSelectedItem

    if cityComboBoxSelectedIndex == -1 {
      showAlert(title: "Invalid City!!!", message: "You must select a valid city to crawl.", style: .warning)
      return
    }

    if udid.isEmpty || auth.isEmpty {
      showAlert(title: "Argument Missing!!!", message: "You must provide UDID and Auth!!!", style: .warning)
      return
    }

    let city = Cities.allCities[cityComboBoxSelectedIndex]

    service.crawl(foodyAuthUDID: udid, foodyAuth: auth, city: city) { [weak self] result in
      guard let `self` = self else { return }
      switch result {
      case .failure(let error):
        self.showAlert(title: "Crawl Failed!!!", message: error.localizedDescription, style: .warning)
      case .success:
        self.showAlert(title: "Crawl Successfully!!!", message: "Successfully crawl foody data", style: .informational)
      }
    }
  }
}

extension NSViewController {
  func showAlert(title: String, message: String, style: NSAlertStyle) {
    let alert = NSAlert()
    alert.messageText = title
    alert.informativeText = message
    alert.addButton(withTitle: "OK")
    alert.alertStyle = style

    alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
  }
}
