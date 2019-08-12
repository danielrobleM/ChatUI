//
//  TextSize.swift
//  themoviedb
//
//  Created by Daniel on 8/11/19.
//  Copyright © 2019 Daniel Roble. All rights reserved.
//

import UIKit
public struct TextSize {
  fileprivate struct CacheEntry: Hashable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let insets: UIEdgeInsets
    func hash(into hasher: inout Hasher) {
      hasher.combine(text)
      hasher.combine(Int(width))
      hasher.combine(Int(insets.top))
      hasher.combine(Int(insets.left))
      hasher.combine(Int(insets.bottom))
      hasher.combine(Int(insets.right))
    }
  }

  fileprivate static var cache = [CacheEntry: CGRect]() {
    didSet {
      assert(Thread.isMainThread)
    }
  }

  public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = UIEdgeInsets.zero) -> CGRect {
    let key = CacheEntry(text: text, font: font, width: width, insets: insets)
    if let hit = cache[key] {
      return hit
    }

    let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
    let attributes = [ NSAttributedString.Key.font: font ]
    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
    var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
    bounds.size.width = width
    bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
    cache[key] = bounds
    return bounds
  }
}

private func ==(lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
  return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
}
