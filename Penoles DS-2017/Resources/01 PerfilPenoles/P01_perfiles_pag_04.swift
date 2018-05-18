//
//  P01_perfiles_pag_04.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 5/16/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class P01_perfiles_pag_04: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		// ASSING A BACKGROUND IMAGE TO THE VIEW
		func assignbackground(){
			let background = UIImage(named: "perfil_pag4")
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
		assignbackground()
		
		
		
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
