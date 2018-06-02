//
//  CoverViewController.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/1/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class CoverPage: Page {
    var viewController: UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "coverViewController")
    }
}

class CoverViewController: UIViewController {
    var image: UIImage! = nil
    
    @IBOutlet weak var backgroundImageCover: UIImageView!
    @IBOutlet weak var textImageCover: UIImageView!
    @IBOutlet weak var frontImageCover: UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        textImageCover.alpha = 0
        frontImageCover.alpha = 0
        
         changeImageBGCover("cover_test_bg","cover_test_text","cover_test_front")
    }
    
    // ASSING A BACKGROUND IMAGE TO THE VIEW
    func changeImageBGCover(_ bk: String,_ txt: String,_ front: String) {
        backgroundImageCover.image = UIImage(named: bk)
        textImageCover.image = UIImage(named: txt)
        frontImageCover.image = UIImage(named: front)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.frontImageCover.alpha = 1
        }) { (true) in
            self.showTitle()
        }
    }
    
    func showTitle(){
        UIView.animate(withDuration: 1, animations: {
            self.textImageCover.alpha = 1
        })
    }
}


