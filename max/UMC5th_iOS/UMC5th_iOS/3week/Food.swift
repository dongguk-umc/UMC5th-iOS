//
//  Food.swift
//  UMC5th_iOS
//
//  Created by seonwoo on 2023/10/09.
//

import Foundation

struct Food {
    var name : String
    var description: String
    var priceOption : [FoodOption]
    var option : FoodOption?
}

struct FoodOption {
    var name : String
    var price : Int
}
