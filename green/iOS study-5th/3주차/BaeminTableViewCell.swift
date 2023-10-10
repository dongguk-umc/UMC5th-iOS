//
//  BaeminTableViewCell.swift
//  iOS study-5th
//
//  Created by 윤지성 on 2023/10/10.
//

import UIKit

class BaeminTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    func setCellData(_ data: Food){
        self.titleLabel.text = data.name
        self.priceLabel.text = String(data.price) + "원"
        self.foodImageView.image = UIImage(named: "pizza")
        self.informationLabel.text = data.information
    }
    
    
}
