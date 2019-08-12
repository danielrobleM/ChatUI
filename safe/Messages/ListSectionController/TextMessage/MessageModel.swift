//
//  MessageModel.swift
//  safe
//
//  Created by Daniel on 8/10/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

import IGListKit
import Foundation

final class MessageModel: NSObject, Codable {
  var id: Int = 0
  var name: String = ""
  var text: String = ""
  var isUser: Bool =  false

  required override init() {
    super.init()
  }

  private enum MessageModelKey: String, CodingKey {
    case id = "id"
    case name = "name"
    case text = "text"
    case isUser = "isUser"
  }

  convenience init(id: Int, name: String, text: String, isUser: Bool) {
    self.init()
    self.id = id
    self.name = name
    self.text = text
    self.isUser = isUser
  }

  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MessageModelKey.self)
    let id = try container.decode(Int.self, forKey: .id)
    let name = try container.decode(String.self, forKey: .name)
    let text = try container.decode(String.self, forKey: .text)
    let isUser = try container.decode(Bool.self, forKey: .isUser)
    self.init(id: id, name: name, text: text, isUser: isUser)
  }
}

extension MessageModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let other = object as? MessageModel else { return false }
    return id == other.id && text == other.text && isUser == other.isUser
  }
}
