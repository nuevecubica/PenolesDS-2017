//
//  ViewController.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 5/4/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
// LOAD VIEW
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// SWIPE LEFT
		let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
		leftSwipe.direction = UISwipeGestureRecognizerDirection.left
		self.view.addGestureRecognizer(leftSwipe)
	}

	
	// WARNINGS
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	

	
}

// SWIPE ACTION FUNCTION
extension UIViewController
{
	@objc func swipeAction(swipe:UISwipeGestureRecognizer){
		switch swipe.direction.rawValue {
		case 1:
			performSegue(withIdentifier: "goLeft", sender: self)
		case 2:
			performSegue(withIdentifier: "goRight", sender: self)
		default:
			break
		}
	}
}
