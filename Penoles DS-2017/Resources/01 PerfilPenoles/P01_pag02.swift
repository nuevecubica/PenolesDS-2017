//
//  P01_pag02.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 5/14/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class P01_pag02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		// ASSING A BACKGROUND IMAGE TO THE VIEW
		func assignbackground(){
			let background = UIImage(named: "mainCoverOk")
			
			var imageView : UIImageView!
			imageView = UIImageView(frame: view.bounds)
			imageView.contentMode =  UIViewContentMode.scaleAspectFill
			imageView.clipsToBounds = true
			imageView.image = background
			imageView.center = view.center
			view.addSubview(imageView)
			self.view.sendSubview(toBack: imageView)
		}
		// SWIPE LEFT
		let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
		leftSwipe.direction = UISwipeGestureRecognizerDirection.left
		self.view.addGestureRecognizer(leftSwipe)
		// SWIPE RIGHT
		let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
		rightSwipe.direction = UISwipeGestureRecognizerDirection.right
		self.view.addGestureRecognizer(rightSwipe)
		
		// RUN BACKGROUND
		//assignbackground()
		
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
		label.center = CGPoint(x: 160, y: 285)
		label.textAlignment = .center
		label.text = "PERFILES PAGE Mapa"
		label.textColor = UIColor(red:255,green:0,blue:0,alpha:1)
		self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	// REMOVE STATUS BAR
	override var prefersStatusBarHidden: Bool{
		return true
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
