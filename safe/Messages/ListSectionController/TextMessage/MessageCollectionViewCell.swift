//
//  MessageCollectionViewCell.swift
//  safe
//
//  Created by Daniel on 8/10/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

final class MessageCollectionViewCell: UICollectionViewCell {
  let marginBottom: CGFloat = 32
  let marginContainer: CGFloat = 32
  let margin: CGFloat = 16

  let container: UIView = {
    let view = UIView()
    view.backgroundColor = .secondarySystemBackground
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 16
    view.layer.masksToBounds = false
    return view
  }()
  let textView: UITextView = {
    let label = UITextView()
    label.textColor = .label
    label.backgroundColor = .clear
    label.isScrollEnabled = false
    label.isUserInteractionEnabled = false
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    return label
  }()

  let userImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "user0")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    makeUI()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    makeUI()
  }

  func makeUI() {
    contentView.backgroundColor = .clear
    contentView.addSubviews([container, textView, userImage])
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
}

extension UIColor {
  static var random: UIColor {
    return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
  }
}

extension UIView {
  func addSubviews(_ subViews: [UIView]) {
    subViews.forEach { self.addSubview($0) }
  }
}

