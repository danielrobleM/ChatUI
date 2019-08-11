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

protocol MessagesPresentationLogic
{
  func presentSomething(response: Messages.Something.Response)
}

class MessagesPresenter: MessagesPresentationLogic
{
  weak var viewController: MessagesDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Messages.Something.Response)
  {
    let viewModel = Messages.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
