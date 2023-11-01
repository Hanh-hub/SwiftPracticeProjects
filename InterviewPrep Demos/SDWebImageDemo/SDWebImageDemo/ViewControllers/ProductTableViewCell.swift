//
//  ProductTableViewCell.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/10/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFit
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var product: Product! {
        didSet {
            configure()
        }
    }
    func configure() {
        titleLabel.text = product.title
        priceLabel.text = "$" + (product.price?.description ?? "invalid price")
        ratingLabel.text = "rating " + (product.rating?.description ?? "invalid rating")
        if let imageUrl = product.thumbnail {
            productImage.sd_setImage(with: URL(string: imageUrl))
        } else {
            productImage.image = UIImage()
        }
       
    }

}
