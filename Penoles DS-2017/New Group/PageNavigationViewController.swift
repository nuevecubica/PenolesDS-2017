//
//  PageNavigationViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

protocol Page {
  var viewController: UIViewController { get }
}

class Section {
  var name: String
  var pages: [Page] = []

  init(name: String, pages: [Page]) {
    self.name = name
    self.pages = pages
  }
}

class PageNavigationViewController: UIViewController {
  @IBOutlet weak var containerView: UIView!

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var menuContainer: UIView!
  @IBOutlet weak var menuStackView: UIStackView!

  var menuConstraint: NSLayoutConstraint!

  var sections:[Section] = [
    Section(name: "Cover", pages: [
      ImagePage(imageName: "mainCoverOk"),
    ]),

    Section(name: "Perfil de Peñoles", pages: [
      ImagePage(imageName: "perfil_pag1"),
      MapPage(),
      ImagePage(imageName: "perfil_pag3"),
      ImagePage(imageName: "perfil_pag4"),
    ]),

    Section(name: "Mensaje del director general", pages: [
      ImagePage(imageName: "mensaje_director"),
    ]),

    Section(name: "Gestión", pages: [
      ImagePage(imageName: "gestion_pag1"),
      ImagePage(imageName: "gestion_pag2"),
      ImagePage(imageName: "gestion_pag3"),
      ImagePage(imageName: "gestion_pag4"),
      ImagePage(imageName: "gestion_pag5"),
      ImagePage(imageName: "gestion_pag6"),
      ImagePage(imageName: "gestion_pag7"),
    ]),

    Section(name: "Grupos", pages: [
      ImagePage(imageName: "grupos_pag1"),
      ImagePage(imageName: "grupos_pag2"),
    ]),

    Section(name: "Transparencia", pages: [
      ImagePage(imageName: "transparencia_pag1"),
    ]),
  ]

  var currentSection: Int = 0
  var currentPage: Int = 0

  var currentVC: UIViewController!
  var currentView: UIView!

  var showingMenu: Bool = false

  override var prefersStatusBarHidden: Bool {
    return true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
    leftSwipe.direction = UISwipeGestureRecognizerDirection.left
    self.view.addGestureRecognizer(leftSwipe)

    let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
    rightSwipe.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(rightSwipe)

    menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)

    NSLayoutConstraint.activate([menuConstraint])
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    setupMenuStackView()

    showPage(pageNumber: 0, inSection: 0)
  }

  func setupMenuStackView() {
    for view in menuStackView.arrangedSubviews {
      view.removeFromSuperview()
    }

    for (index,section) in sections.enumerated() {
      let button = UIButton(type: .custom)
      button.setTitle(section.name, for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.tag = index
      button.addTarget(self, action: #selector(sectionTapped(_:)), for: .touchUpInside)

      button.translatesAutoresizingMaskIntoConstraints = false
      menuStackView.addArrangedSubview(button)

      NSLayoutConstraint.activate([
        button.heightAnchor.constraint(equalToConstant: 40.0)
      ])
    }
  }

  @IBAction func sectionTapped(_ sender: UIButton) {
    showPage(pageNumber: 0, inSection: sender.tag)
    toggleMenu(sender)
  }

  @IBAction func toggleMenu(_ sender: UIButton) {
    NSLayoutConstraint.deactivate([menuConstraint])

    if showingMenu {
      // Hide
      menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
    }
    else {
      // Show
      menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
    }

    NSLayoutConstraint.activate([menuConstraint])

    UIView.animate(withDuration: 0.5) {
      self.view.layoutIfNeeded()
    }

    showingMenu = !showingMenu
  }

  @objc func swipeAction(swipe:UISwipeGestureRecognizer){
    switch swipe.direction {
    case .right:
      let newPage = currentPage - 1
      if newPage >= 0 { showPage(pageNumber: newPage, inSection: currentSection) }
      else {
        let newSection = currentSection - 1
        if newSection >= 0 { showPage(pageNumber: sections[newSection].pages.count - 1, inSection: newSection) }
      }
    case .left:
      let newPage = currentPage + 1
      if newPage < sections[currentSection].pages.count { showPage(pageNumber: newPage, inSection: currentSection) }
      else {
        let newSection = currentSection + 1
        if newSection < sections.count { showPage(pageNumber: 0, inSection: newSection) }
      }
    default:
      break
    }
  }

  func showPage(pageNumber: Int, inSection section: Int) {
    titleLabel.text = sections[section].name

    let newViewController = sections[section].pages[pageNumber].viewController
    let newView = newViewController.view!

    newView.translatesAutoresizingMaskIntoConstraints = false

    addChildViewController(newViewController)
    containerView.addSubview(newView)

    newView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      newView.topAnchor.constraint(equalTo: containerView.topAnchor),
      newView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      newView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      newView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
    ])

    newViewController.didMove(toParentViewController: self)

    newView.alpha = 0.0

    self.view.layoutIfNeeded()

    UIView.animate(withDuration: 0.5, animations: {
      newView.alpha = 1.0
      self.currentView?.alpha = 0.0
    }) { (_) in
      self.currentVC?.willMove(toParentViewController: nil)
      self.currentView?.removeFromSuperview()
      self.currentVC?.removeFromParentViewController()

      self.currentView = newView
      self.currentVC = newViewController

      self.currentPage = pageNumber
      self.currentSection = section
    }
  }

}
