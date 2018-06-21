//
//  des_soc_10.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_soc_10Page: ImagePage {
    override var viewController: UIViewController {
        return des_soc_10ViewController(image: UIImage(named: imageName)!)
    }
}

class des_soc_10ViewController: PageWithButtonsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let imageScale = view.bounds.width / imageView.image!.size.width
        
        let icon = "plus"
        let icon2 = "play_orange"
        
        //**************************************
        // Button video seguridad y salud
        //**************************************
        let button_vid = UIButton(frame: CGRect())
        button_vid.addTarget(self, action: #selector(btn_vid_Pressed(_:)), for: .touchUpInside)
        button_vid.setImage(UIImage(named : icon2), for: UIControlState.normal)
        imageView.addSubview(button_vid)
        button_vid.translatesAutoresizingMaskIntoConstraints = false
        /*
         button_vid.layer.shadowColor = UIColor.black.cgColor
         button_vid.layer.shadowOffset = CGSize(width: 5, height: 5)
         button_vid.layer.shadowRadius = 5
         button_vid.layer.shadowOpacity = 1.0
         */
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_vid.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 480.0 * imageScale),
            button_vid.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  324.0 * imageScale)
            ])
        //**************************************

        //**************************************
        // Button indice de seguridad
        //**************************************
        let button_vvq = UIButton(frame: CGRect())
        button_vvq.addTarget(self, action: #selector(button_vvq_Pressed(_:)), for: .touchUpInside)
        button_vvq.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_vvq)
        button_vvq.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_vvq.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 850.0 * imageScale),
            button_vvq.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1895.0 * imageScale)
            ])
        //*************************************
        
        //**************************************
        // Button indice de Accidentes
        //**************************************
        let button_iacc = UIButton(frame: CGRect())
        button_iacc.addTarget(self, action: #selector(button_iacc_Pressed(_:)), for: .touchUpInside)
        button_iacc.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_iacc)
        button_iacc.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_iacc.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40.0 * imageScale),
            button_iacc.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  2170.0 * imageScale)
            ])
        //*************************************
        
        //**************************************
        // Button indice de dias perdidos
        //**************************************
        let button_dp = UIButton(frame: CGRect())
        button_dp.addTarget(self, action: #selector(button_dp_Pressed(_:)), for: .touchUpInside)
        button_dp.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_dp)
        button_dp.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_dp.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 325.0 * imageScale),
            button_dp.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  2170.0 * imageScale)
            ])
        //*************************************
        
        //**************************************
        // Button indice de siniestralidad
        //**************************************
        let button_is = UIButton(frame: CGRect())
        button_is.addTarget(self, action: #selector(button_is_Pressed(_:)), for: .touchUpInside)
        button_is.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_is)
        button_is.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_is.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 600.0 * imageScale),
            button_is.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  2170.0 * imageScale)
            ])
        //*************************************
        
  
    }
    
    //*****************************************
    // PRESS FUNCTIONS
    //*****************************************
    @IBAction func btn_vid_Pressed(_ sender: UIButton) {
        showVideoPopup(videoName: "des_social_10_vid")
    }
    
    @IBAction func button_vvq_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "pag10_Indicesdeseguridad"))
    }
    @IBAction func button_iacc_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "pag10_IndicedeAccidentabilidad"))
    }
    @IBAction func button_dp_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "pag10_IndicedeDiasPerdidos"))
    }
    @IBAction func button_is_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "pag10_IndicedeSiniestralidad"))
    }
  
}


