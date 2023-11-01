//
//  DetailViewController.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/11/23.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
   
//    {
//        didSet {
//            if product != nil {
//                configure()
//
//            }
//        }
//    }
        func configure(){
            
            if let imageUrl = product?.thumbnail {
                productImage.sd_setImage(with: URL(string: imageUrl))
            }
            
            productTitleLabel.text = product.title
            descriptionLabel.text = product.description
            priceLabel.text = "$\(product.price ?? 0.0)"
        }
        deinit {
            print("detail view deinit")
        }
    }
    
