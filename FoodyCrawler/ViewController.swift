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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    button.target = self
    button.action = #selector(login)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  func login() {
    let url = "https://www.foody.vn/__get/Place/HomeListPlace?t=1508229586641&page=1&lat=11.142383&lon=106.62913&count=12&districtId=&cateId=&cuisineId=&isReputation=&type=1"

    var request = URLRequest(url: URL(string: url)!)
    request.httpShouldHandleCookies = true
    request.setValue("www.foody.vn", forHTTPHeaderField: "Host")
    request.setValue("Connection", forHTTPHeaderField: "keep-alive")
    request.setValue("1", forHTTPHeaderField: "Upgrade-Insecure-Requests")
    request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36", forHTTPHeaderField: "User-Agent")
    request.setValue("application/json, text/plain, */*", forHTTPHeaderField: "Accept")
    request.setValue("https://www.foody.vn", forHTTPHeaderField: "Referer")
    request.setValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
    request.setValue("en-US,en;q=0.8,vi;q=0.6", forHTTPHeaderField: "Accept-Language")
//    request.setValue("FOODY.AUTH.UDID=72ec5fdb-f892-49d5-b010-ca717068af6b", forHTTPHeaderField: "Cookie")
    request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
    request.setValue("FOODY.AUTH=FF6FB261538A74B9602D52F8F01FE26244DD79C6B5493738D7CA2EE2F2FAB52C6943D16E716B73D5DD4DC72E39180B4AD756AE0247085F16215FBA3A68E4A02C6BF736DA97B06B468D59E2C1D9B9BB3F1285AC237E51CC04F424D786AB1BEBEDC4104AB2E796E1968D8E03FD53A7DEC50B6ECC2E1A4B9BFCF312E237FB8687AC86A9C01AF71B118D0F6EFEBA7CDFBF62801B60BAAB08FC2A2133F50D3C1EA45E3759F6F197C3995D0AD6DBA52CE1C255DD856D6BC8F78DCA2D683AE6A548471A4F6BBCA1F6EF9ECF67F6D36DB8CAEE95A6238722C27AB08CED7016A07A64F2E1; FOODY.AUTH.UDID=72ec5fdb-f892-49d5-b010-ca717068af6b; gcat=travel; floc=230", forHTTPHeaderField: "Cookie")
//    request.setValue("gcat=entertain", forHTTPHeaderField: "Cookie")
//    request.setValue("floc=230", forHTTPHeaderField: "Cookie")

    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
      if let response = response as? HTTPURLResponse {
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.allHeaderFields as! [String: String], for: response.url!)
        print(cookies)
        print(response.statusCode)
        print(response.allHeaderFields)
        print(HTTPCookieStorage.shared.cookies!)
      }

      if let data = data {
        let responseData = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        let dict = (responseData as! [String: Any])
        let firstItem = (dict["Items"] as! [[String: Any]]).first
        let name = firstItem?["Name"] as! String

//        self.label.stringValue = name
//        print(responseData)
      }
    }
    
    task.resume()
  }
}

