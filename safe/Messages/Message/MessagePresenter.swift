//
//  MessagesPresenter.swift
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

protocol MessagesPresentationLogic {
  func presentNewImage(response: Messages.newImage.Response)
  func getMessagesDisplayLogic() -> MessagesDisplayLogic?
}

class MessagesPresenter: MessagesPresentationLogic {
  weak var viewController: MessagesDisplayLogic?

  func presentNewImage(response: Messages.newImage.Response) {
    let viewModel = Messages.newImage.ViewModel(
      image: response.image,
      name: response.name,
      isUser: response.isUser
    )
    viewController?.displayImage(viewModel: viewModel)
  }

  func getMessagesDisplayLogic() -> MessagesDisplayLogic?{
    return viewController
  }
}
