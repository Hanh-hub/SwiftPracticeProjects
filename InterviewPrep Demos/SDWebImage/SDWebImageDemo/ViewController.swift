//
//  ViewController.swift
//  SDWebImage
//
//  Created by Hanh Vo on 4/7/23.
//

import UIKit
import Foundation
import SDWebImage

class ViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
       

        // Do any additional setup after loading the view.
    }


}

