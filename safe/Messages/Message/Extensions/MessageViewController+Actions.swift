//
//  MessageViewController+Actions.swift
//  safe
//
//  Created by Daniel on 9/29/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

// MARK: - Input Notifications callbacks actions
extension MessagesViewController {
  func onButtonSend(message: String) {
    let id = Int.random(in: 200 ..< 100000)
    let newMessage = MessageModel(id: id, name: "Daniel", text: message, isUser: true)
    messages.append(newMessage)
    self.adapter.performUpdates(animated: true) { (completed) in
      self.adapter.scroll(to: newMessage, supplementaryKinds: nil, scrollDirection: .vertical, scrollPosition: .centeredVertically, animated: true)
    }
  }

  func onCameraButton() {
    presentImagePicker(source: .camera)
  }

  func onGalleryButton() {
    presentImagePicker(source: .photoLibrary)
  }

  func presentImagePicker(source: UIImagePickerController.SourceType) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = source
    self.present(imagePicker, animated: true, completion: nil)
  }
}

// MARK: - UIImagePickerControllerDelegate
extension MessagesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("didFinishPickingMediaWithInfo")
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      self.interactor?.sendImage(request: Messages.newImage.Request(image: image))
    }
    self.dismiss(animated: true, completion: nil)
  }
}
