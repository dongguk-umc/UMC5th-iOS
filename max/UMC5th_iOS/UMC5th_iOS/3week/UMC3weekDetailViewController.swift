//
//  UMC3weekDetailViewController.swift
//  UMC5th_iOS
//
//  Created by seonwoo on 2023/10/09.
//

import Foundation
import UIKit

class UMC3weekDetailViewController : UIViewController {
    
    var data : Food?

    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var option2Name: UILabel!
    @IBOutlet weak var option1Name: UILabel!
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodName.text = data?.name
        
        if(data != nil){
            option1Name.text = "\(data!.priceOption[0].name)(\(data!.priceOption[0].price))"
            if(data?.option != nil){
                option2Name.text = "\(data!.option!.name)(\(data!.option!.price))"
                totalPrice.text = "\(data!.priceOption[0].price + data!.option!.price)원"
            }else{
                option2Name.text = ""
                totalPrice.text = "\(data!.priceOption[0].price)원"
            }
           
        }
        orderButton.setTitle((totalPrice.text ?? "0") + " 주문하기", for: .normal)
       
    }

}
