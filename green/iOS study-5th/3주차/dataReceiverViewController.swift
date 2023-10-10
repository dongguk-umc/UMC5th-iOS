//
//  dataReceiverViewController.swift
//  iOS study-5th
//
//  Created by 윤지성 on 2023/10/10.
//

import UIKit

class dataReceiverViewController: UIViewController {
    var selectedFood: Food = Food(name: "", price: 0, information: "")
    var foodList: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        foodList.append(selectedFood)
        
        baedalTableview.dataSource = self
        baedalTableview.delegate = self
        
        let nib = UINib(nibName: "BaeminTableViewCell", bundle: nil)
        baedalTableview.register(nib, forCellReuseIdentifier: "BaeminTableViewCell")
        

    }
    
    @IBOutlet weak var baedalTableview: UITableView!
    
    @IBAction func backBtnDidTap(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
}
extension dataReceiverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaeminTableViewCell", for: indexPath) as? BaeminTableViewCell else { return UITableViewCell() }
        
        cell.setCellData(foodList[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120
       }
    
}
