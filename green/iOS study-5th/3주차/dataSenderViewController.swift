//
//  dataSenderViewController.swift
//  iOS study-5th
//
//  Created by 윤지성 on 2023/10/10.
//

import UIKit

class dataSenderViewController: UIViewController {
    var selectedFood: Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediumBtn.tag = 0
        largeBtn.tag = 1
        
        mediumBtn.addTarget(self, action: #selector(touchUpButton(_:)), for: .touchUpInside)
        largeBtn.addTarget(self, action: #selector(touchUpButton(_:)), for: .touchUpInside)
        
    }
    
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var largeBtn: UIButton!
    
  
    
    @objc func touchUpButton(_ sender: UIButton) {
        setBtnDefault()
        sender.setImage(UIImage(named: "buttonClicked"), for: .normal)
        
        switch sender.tag {
        case 0:
            selectedFood = Food(name: "[재주문 1위] 바싹불고기 피자", price: 20000, information: "가격: M  (20,000원)")
        case 1:
            selectedFood = Food(name: "[재주문 1위] 바싹불고기 피자", price: 23000, information: "가격: L  (23,000원)")
        default:
            selectedFood = Food(name: "", price: 0, information: "")
        }
    }
    func setBtnDefault(){
        mediumBtn.setImage(UIImage(named: "unclikedButton"), for: .normal)
        largeBtn.setImage(UIImage(named: "unclikedButton"), for: .normal)
    }
    

    @IBAction func submitBtnDidTap(_ sender: UIButton) {
        let newVC = self.storyboard!.instantiateViewController(withIdentifier: "dataReceiverViewController") as! dataReceiverViewController
        
        guard let food = selectedFood else {
            newVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(newVC, animated: false)
            return
        }
        newVC.selectedFood = food
        newVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(newVC, animated: false)
    }
}
