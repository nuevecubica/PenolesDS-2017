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

protocol ScrollablePageViewController {
  var showsScrollIndicator: Bool { get }
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

    @IBOutlet weak var scrollInidcator: UIImageView!
    
    var menuConstraint: NSLayoutConstraint!
    
    var sections:[Section] = [
        Section(name: "Portada", pages: [
           // ImagePage(imageName: "portada"),
            CoverPage(theBg: "cover_bg", theFront: "cover_title", theTitle: "cover_front")
            ]),
        
        Section(name: "Perfil de Peñoles", pages: [
            
            ImagePage(imageName: "perfil_pag1"),
            MapPage(),
            ImagePage(imageName: "perfil_pag3"),
            ImagePage(imageName: "perfil_pag4"),
            ]),
        
        Section(name: "Mensaje del Director General", pages: [
            ImagePage(imageName: "mensaje_director"),
            ]),
        
        Section(name: "Gestión de la sustentabilidad", pages: [
            CoverPage(theBg: "gestion_bg", theFront: "gestion_front",theTitle:"gestion_title"),
            //ImagePage(imageName: "gestion_pag1"),
            ImagePage(imageName: "gestion_pag2"),
            ImagePage(imageName: "gestion_pag3"),
            ImagePage(imageName: "gestion_pag4"),
            ImagePage(imageName: "gestion_pag5"),
            ImagePage(imageName: "gestion_pag6"),
            ImagePage(imageName: "gestion_pag7"),
            ]),
        
        Section(name: "Grupos de interés", pages: [
            CoverPage(theBg: "grupos_bg", theFront: "grupos_front",theTitle:"grupos_title"),
            //ImagePage(imageName: "grupos_pag1"),
            ImagePage(imageName: "grupos_pag2"),
            ]),
        
        Section(name: "Transparencia y cumplimiento", pages: [
            CoverPage(theBg: "transparencia_bg", theFront: "transparencia_front",theTitle:"transparencia_title"),
            //ImagePage(imageName: "transparencia_pag1"),
            ImagePage(imageName: "transparencia_pag2"),
            ImagePage(imageName: "transparencia_pag3"),
            ImagePage(imageName: "transparencia_pag4"),
            ImagePage(imageName: "transparencia_pag5"),
            ImagePage(imageName: "transparencia_pag6"),
            ImagePage(imageName: "transparencia_pag7"),
            ImagePage(imageName: "transparencia_pag8"),
            ImagePage(imageName: "transparencia_pag9"),
            ImagePage(imageName: "transparencia_pag10"),
            ]),
        
        Section(name: "Desempeño económico", pages: [
            CoverPage(theBg: "desemp_economico_bg", theFront: "desemp_economico_front",theTitle:"desemp_economico_title"),
            //ImagePage(imageName: "des_economico_pag1"),
            ImagePage(imageName: "des_economico_pag2"),
            ImagePage(imageName: "des_economico_pag3"),
            ImagePage(imageName: "des_economico_pag4"),
            ImagePage(imageName: "des_economico_pag5"),
            ImagePage(imageName: "des_economico_pag6"),
            ImagePage(imageName: "des_economico_pag7"),
            ImagePage(imageName: "des_economico_pag8"),
            ImagePage(imageName: "des_economico_pag9"),
            ImagePage(imageName: "des_economico_pag10"),
            ImagePage(imageName: "des_economico_pag11"),
            ImagePage(imageName: "des_economico_pag12"),
            ]),
        
        Section(name: "Desempeño ambiental", pages: [
            CoverPage(theBg: "desemp_ambiental_bg", theFront: "desemp_ambiental_front",theTitle:"desemp_ambiental_title"),
            //ImagePage(imageName: "des_ambiental_pag1"),
            ImagePage(imageName: "des_ambiental_pag2"),
            ImagePage(imageName: "des_ambiental_pag3"),
            ImagePage(imageName: "des_ambiental_pag4"),
            ImagePage(imageName: "des_ambiental_pag5"),
            ImagePage(imageName: "des_ambiental_pag6"),
            ImagePage(imageName: "des_ambiental_pag7"),
            ImagePage(imageName: "des_ambiental_pag8"),
            ImagePage(imageName: "des_ambiental_pag9"),
            ImagePage(imageName: "des_ambiental_pag10"),
            ]),
        
        Section(name: "Desempeño social", pages: [
            CoverPage(theBg: "desemp_social_bg", theFront: "desemp_social_front",theTitle:"desemp_social_title"),
            //ImagePage(imageName: "des_social_pag1"),
            ImagePage(imageName: "des_social_pag2"),
            ImagePage(imageName: "des_social_pag3"),
            ImagePage(imageName: "des_social_pag4"),
            ImagePage(imageName: "des_social_pag5"),
            ImagePage(imageName: "des_social_pag6"),
            ImagePage(imageName: "des_social_pag7"),
            ImagePage(imageName: "des_social_pag8"),
            ImagePage(imageName: "des_social_pag9"),
            ImagePage(imageName: "des_social_pag10"),
            ImagePage(imageName: "des_social_pag11"),
            ImagePage(imageName: "des_social_pag12"),
            ImagePage(imageName: "des_social_pag13"),
            ImagePage(imageName: "des_social_pag14"),
            ImagePage(imageName: "des_social_pag15"),
            ImagePage(imageName: "des_social_pag16"),
            ImagePage(imageName: "des_social_pag17"),
            ImagePage(imageName: "des_social_pag18"),
            ImagePage(imageName: "des_social_pag19"),
            ImagePage(imageName: "des_social_pag20"),
            ImagePage(imageName: "des_social_pag21"),
            ImagePage(imageName: "des_social_pag22"),
            ImagePage(imageName: "des_social_pag23"),
            ImagePage(imageName: "des_social_pag24"),
            ImagePage(imageName: "des_social_pag25"),
            ImagePage(imageName: "des_social_pag26"),
            ImagePage(imageName: "des_social_pag27"),
            ImagePage(imageName: "des_social_pag28"),
            ImagePage(imageName: "des_social_pag29"),
            ImagePage(imageName: "des_social_pag30"),
            ]),
        
        Section(name: "Premios y distinciones", pages: [
            ImagePage(imageName: "premios_pag1"),
            ]),
        
        Section(name: "Asociaciones", pages: [
            ImagePage(imageName: "asociaciones_pag1"),
            ]),
        
        Section(name: "Cuarto Estado Financiero", pages: [
            ImagePage(imageName: "estado_financiero_pag1"),
            ]),
        
        Section(name: "Acerca de este informe", pages: [
            ImagePage(imageName: "acerca_informe_pag1"),
            ImagePage(imageName: "acerca_informe_pag2"),
            ImagePage(imageName: "acerca_informe_pag3"),
            ImagePage(imageName: "acerca_informe_pag4"),
            ImagePage(imageName: "acerca_informe_pag5"),
            ]),
        
        Section(name: "Datos de contacto", pages: [
            ImagePage(imageName: "contacto_pag1"),
            ]),
        Section(name: "Contra portada", pages: [
            ImagePage(imageName: "contra_pag1"),
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
            button.setTitleColor(.white, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(sectionTapped(_:)), for: .touchUpInside)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
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

      if let scrollableVV = newViewController as? ScrollablePageViewController {
        scrollInidcator.isHidden = !scrollableVV.showsScrollIndicator
      } else {
        scrollInidcator.isHidden = true
      }

    }
    
}
