//
//  MapViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class MapPage: Page {
  var viewController: UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapViewController")
  }
}

class MapViewController: UIViewController {

}


