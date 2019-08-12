//
//  imageSectionController.swift
//  safe
//
//  Created by Daniel on 8/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import IGListKit
import SDWebImage

final class ImagesSectionController: ListSectionController {
  private var model: ImageModel?
  private var top: CGFloat = 16.0
  private var bottom: CGFloat = 16.0
  private let textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
  override init() {
    super.init()
  }

  override func didUpdate(to object: Any) {
    guard let model = object as? ImageModel else { return }
    self.model = model
  }
}

extension ImagesSectionController {
  override func numberOfItems() -> Int {
    return model == nil ? 0 : 1
  }

  override func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize.zero }
    let width = context.containerSize.width
    return CGSize(width: width, height: 208)
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    let cellClass = ImageCollectionViewCell.self
    guard let context = collectionContext,
      let cell = context.dequeueReusableCell(of: cellClass, for: self, at: index) as? ImageCollectionViewCell,
      let model = self.model else {
        assertionFailure("collection context is nil");
        return UICollectionViewCell()
    }

    if model.isUser {
      let width = context.containerSize.width
      cell.container.frame = CGRect(x: width - 250 - 16, y: 0, width: 250, height: 208)
      cell.userImage.frame = .zero
      cell.container.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner]
    } else {
      cell.container.frame = CGRect(x: 60, y: 0, width: 250, height: 208)
      cell.container.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
      cell.userImage.frame = CGRect(x: 16, y: 0, width: 28, height: 28)
    }
    let url = URL(string: model.imageUrl)
    cell.container.sd_setImage(with: url, completed: nil)

    return cell
  }
}
