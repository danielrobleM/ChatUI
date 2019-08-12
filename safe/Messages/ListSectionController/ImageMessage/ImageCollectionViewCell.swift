//
//  ImageCollectionViewCell.swift
//  safe
//
//  Created by Daniel on 8/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
  let marginBottom: CGFloat = 32
  let marginContainer: CGFloat = 32
  let margin: CGFloat = 16

  let container: UIImageView = {
    let view = UIImageView()
    view.backgroundColor = .white
      // purple UIColor(red: 0.33, green: 0.41, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 16
    view.layer.masksToBounds = false
    view.clipsToBounds = true
    view.contentMode = .scaleAspectFill
    return view
  }()

  lazy var userImage: UIImageView = {
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
    contentView.addSubviews([container, userImage])
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
}
