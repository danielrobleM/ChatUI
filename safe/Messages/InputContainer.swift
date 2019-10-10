//
//  Composer.swift
//  safe
//
//  Created by Daniel on 8/13/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class InputContainer: UIView {
  var onSendButtonPressed: ((String) -> Void)?
  var onCameraButtonPressed: (() -> Void)?
  var onGalleryButtonPressed: (() -> Void)?

  let cameraButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("📷", for: .normal)
    return btn
  }()

  let galleryButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("🌌", for: .normal)
    return btn
  }()

  let sendButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "Send"), for: .normal)
    return btn
  }()

  let textfield: UITextField = {
    let textfield = UITextField()
    textfield.textColor = .white
    textfield.attributedPlaceholder = NSAttributedString(
      string: "Message",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.34, green: 0.39, blue: 0.44, alpha: 1)]
    )
    textfield.backgroundColor = .tertiarySystemBackground
    textfield.layer.cornerRadius = 15

    return textfield
  }()

  let topDividerView: UIView = {
    let view = UIView()
    view.backgroundColor = .opaqueSeparator
    return view
  }()

  let textfieldHeight: CGFloat = 30

  init() {
    super.init(frame: .zero)
    makeUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var intrinsicContentSize: CGSize {
    return CGSize.zero
  }

  func makeUI() {
    self.addSubviews([cameraButton, galleryButton, textfield, topDividerView, sendButton])
    cameraButton.translatesAutoresizingMaskIntoConstraints = false
    cameraButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    cameraButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    cameraButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
    cameraButton.heightAnchor.constraint(equalToConstant: 32).isActive = true

    galleryButton.translatesAutoresizingMaskIntoConstraints = false
    galleryButton.leadingAnchor.constraint(equalTo: self.cameraButton.trailingAnchor, constant: 8).isActive = true

    galleryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    galleryButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
    galleryButton.heightAnchor.constraint(equalToConstant: 32).isActive = true


    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.leadingAnchor.constraint(equalTo: self.galleryButton.trailingAnchor, constant: 16).isActive = true
    textfield.heightAnchor.constraint(equalToConstant: textfieldHeight).isActive = true
    textfield.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    textfield.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -8).isActive = true
    textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfieldHeight))
    textfield.leftViewMode = .always

    topDividerView.translatesAutoresizingMaskIntoConstraints = false
    topDividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topDividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    topDividerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    topDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true

    sendButton.translatesAutoresizingMaskIntoConstraints = false
    sendButton.centerYAnchor.constraint(equalTo: textfield.centerYAnchor).isActive = true
    sendButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
    sendButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    sendButton.leadingAnchor.constraint(equalTo: self.textfield.trailingAnchor, constant: 16).isActive = true
    sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true

    self.backgroundColor = .secondarySystemBackground

    sendButton.addTarget(self, action: #selector(onSendButtonPressed(sender:)), for: .touchUpInside)
    cameraButton.addTarget(self, action: #selector(onCameraButtonPressed(sender:)), for: .touchUpInside)
    galleryButton.addTarget(self, action: #selector(onGalleryButtonPressed(sender:)), for: .touchUpInside)
  }

  @objc func onSendButtonPressed(sender: UIButton) {
    let text = textfield.text?.count ?? -1 > 0 ? textfield.text : "🤷🏻‍♂️"
    onSendButtonPressed?(text ?? "🤷🏻‍♂️")
    textfield.text = ""
  }

  @objc func onCameraButtonPressed(sender: UIButton) {
    onCameraButtonPressed?()
  }

  @objc func onGalleryButtonPressed(sender: UIButton) {
    onGalleryButtonPressed?()
  }
}
