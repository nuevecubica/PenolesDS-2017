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
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var btn_exploration: UIButton!
    @IBOutlet weak var btn_minas: UIButton!
    @IBOutlet weak var btn_metales: UIButton!
    @IBOutlet weak var btn_quimicos: UIButton!
    @IBOutlet weak var btn_minas_rentadas: UIButton!
    @IBOutlet weak var btn_minas_cerradas: UIButton!
    @IBOutlet weak var btn_minas_restauradas: UIButton!
    @IBOutlet weak var btn_oficinas_comerciales: UIButton!
    @IBOutlet weak var btn_subsidiarias: UIButton!
    @IBOutlet weak var btn_sonora: UIButton!
    @IBOutlet weak var btn_coahuila: UIButton!
    @IBOutlet weak var btn_zacatecas: UIButton!
    @IBOutlet weak var btn_durango: UIButton!
    @IBOutlet weak var btn_ciudad_mexico: UIButton!
    @IBOutlet weak var btn_chihuahua: UIButton!
    @IBOutlet weak var btn_estado_mexico: UIButton!
    @IBOutlet weak var btn_guerrero: UIButton!
    @IBOutlet weak var btn_oaxaca: UIButton!
    @IBOutlet weak var btn_tamaulipas: UIButton!
    
    @IBAction func btn_exploration(_ sender: UIButton) {
      changeImage("mapa_exploracion_minas")
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()

        changeImage("mapa0")

        btn_exploration.contentHorizontalAlignment = .left
        btn_minas.contentHorizontalAlignment = .left
        btn_metales.contentHorizontalAlignment = .left
        btn_quimicos.contentHorizontalAlignment = .left
        btn_minas_rentadas.contentHorizontalAlignment = .left
        btn_minas_cerradas.contentHorizontalAlignment = .left
        btn_minas_restauradas.contentHorizontalAlignment = .left
        btn_oficinas_comerciales.contentHorizontalAlignment = .left
        btn_subsidiarias.contentHorizontalAlignment = .left
        btn_sonora.contentHorizontalAlignment = .left
        btn_coahuila.contentHorizontalAlignment = .left
        btn_zacatecas.contentHorizontalAlignment = .left
        btn_durango.contentHorizontalAlignment = .left
        btn_ciudad_mexico.contentHorizontalAlignment = .left
        btn_chihuahua.contentHorizontalAlignment = .left
        btn_estado_mexico.contentHorizontalAlignment = .left
        btn_guerrero.contentHorizontalAlignment = .left
        btn_oaxaca.contentHorizontalAlignment = .left
        btn_tamaulipas.contentHorizontalAlignment = .left
    }
    
    // ASSING A BACKGROUND IMAGE TO THE VIEW
    func changeImage(_ name: String) {
      backgroundImage.image = UIImage(named: name)
    }
}
