//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Hanh Vo on 1/30/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // https://iosacademy.io/api/courses/index.php
        //https://iosacademy.io/api/v1/courses/index.php
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        view.addSubview(button)
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .systemBlue
        button.center = view.center
    }


}

