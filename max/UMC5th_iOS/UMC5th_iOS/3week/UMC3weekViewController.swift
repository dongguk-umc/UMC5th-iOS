//
//  UMC3weekViewController.swift
//  UMC5th_iOS
//
//  Created by seonwoo on 2023/10/09.
//

import Foundation
import UIKit

class UMC3weekViewController: UIViewController {
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodDescription: UILabel!
    
    @IBOutlet weak var priceOption1: UILabel!
    @IBOutlet weak var priceOption2: UILabel!
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var price2: UILabel!
    
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var optionPrice: UILabel!
    
    @IBOutlet weak var optionButton: UIButton!
    var isTapOptionButton : Bool = false
    
    @IBOutlet var radioButtons: [UIButton]!
    
    var food : Food = Food(name: "파스타",
                           description: "맛있는 파스타 입니다.",
                           priceOption: [
    FoodOption(name: "파스타(중)", price:12000),
    FoodOption(name: "파스타(대)", price:14000)
    ], option: FoodOption(name: "치즈 추가", price:2000))
    
    var selectedOption : Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        foodName.text = food.name
        foodDescription.text = food.description
        
        self.radioButtons.forEach{
            $0.addTarget(self, action: #selector(self.radioButton(_:)), for: .touchUpInside)
        }
        
        self.optionButton.addTarget(self, action: #selector(self.optionButton(_:)), for: .touchUpInside)
        
        priceOption1.text = food.priceOption[0].name
        priceOption2.text = food.priceOption[1].name
        price1.text =  "\(food.priceOption[0].price)"
        price2.text = "\(food.priceOption[1].price)"
        option1.text = food.option!.name
        optionPrice.text = "\(food.option!.price)"
    }
    
    @IBAction func pageMove(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "UMC3weekDetailViewController") as? UMC3weekDetailViewController else {
            return
        }
        vc.data = selectedOption
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func radioButton(_ sender : UIButton){
        
        
        self.radioButtons.forEach{
            if $0.tag == sender.tag{
                $0.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                selectedOption = Food(name: food.name, description: food.description, priceOption: [food.priceOption[sender.tag]], option: nil)
            }else{
                $0.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
    
    @objc private func optionButton(_ sender : UIButton){
        
        if(isTapOptionButton){
            isTapOptionButton = false
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            selectedOption?.option = nil
        }else{
            isTapOptionButton = true
            sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            selectedOption?.option = food.option
        }
    }
}



