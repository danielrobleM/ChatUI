//
//  MessagesModels.swift
//  safe
//
//  Created by Daniel on 8/10/19.
//  Copyright (c) 2019 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Messages {
  // MARK: Show image picker View Controller
  enum newImage {
    struct Request {
      let image: UIImage
    }
    struct Response {
      let image: UIImage
      let name: String
      let isUser: Bool
    }
    struct ViewModel {
      let image: UIImage
      let name: String
      let isUser: Bool
    }
  }
}
