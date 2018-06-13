//
//  DerrameEconomico.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 6/13/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class DerrameEconomicoPage: ImagePage {
  override var viewController: UIViewController {
    return DerrameEconomicoViewController(image: UIImage(named: imageName)!)
  }
}

class DerrameEconomicoViewController: PageWithButtonsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    imageView.isUserInteractionEnabled = true

    let imageScale = view.bounds.width / imageView.image!.size.width

    // Button
    let button = UIButton()
    button.setTitle("Blah", for: .normal)
    button.setTitleColor(.orange, for: .normal)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

    imageView.addSubview(button)

    button.translatesAutoresizingMaskIntoConstraints = false

    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 340.0 * imageScale),
      button.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  310.0 * imageScale)
    ])
  }

  @IBAction func buttonPressed(_ sender: UIButton) {
    //showImagePopup(image: #imageLiteral(resourceName: "popup"))
    showVideoPopup(videoName: "video")
  }
}
