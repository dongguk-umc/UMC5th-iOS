//
//  CarrotTableViewCell.swift
//  iOS study-5th
//
//  Created by 윤지성 on 2023/10/02.
//

import UIKit

class CarrotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var locationNcreatedAt: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productImageView.layer.cornerRadius = 20
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
