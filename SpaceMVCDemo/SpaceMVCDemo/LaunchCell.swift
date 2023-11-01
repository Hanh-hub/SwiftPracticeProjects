//
//  LaunchCell.swift
//  SpaceMVCDemo
//
//  Created by Hanh Vo on 1/22/23.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    @IBOutlet weak var rocket: UILabel!
    @IBOutlet weak var details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
