//
//  photoModel.swift
//  safe
//
//  Created by Daniel on 8/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

import IGListKit
import Foundation

final class ImageModel: NSObject, Codable {
  var id: Int = 0
  var userName: String = ""
  var isUser: Bool = false
  var imageUrl: String = ""

  required override init() {
    super.init()
  }

  private enum MessageModelKey: String, CodingKey {
    case id = "id"
    case userName = "userName"
    case isUser = "isUser"
    case imageUrl = "imageUrl"
  }

  convenience init(id: Int, name: String, imageUrl: String, isUser: Bool) {
    self.init()
    self.id = id
    self.userName = name
    self.imageUrl = imageUrl
    self.isUser = isUser
  }

  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MessageModelKey.self)
    let id = try container.decode(Int.self, forKey: .id)
    let name = try container.decode(String.self, forKey: .userName)
    let isUser = try container.decode(Bool.self, forKey: .isUser)
    let imageUrl = try container.decode(String.self, forKey: .imageUrl)
    self.init(id: id, name: name, imageUrl: imageUrl, isUser: isUser)
  }
}

extension ImageModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let other = object as? ImageModel else { return false }
    return id == other.id && imageUrl == other.imageUrl
  }
}
