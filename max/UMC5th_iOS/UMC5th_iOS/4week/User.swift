//
//  User.swift
//  UMC5th_iOS
//
//  Created by seonwoo on 2023/10/19.
//

import Foundation
import RealmSwift
import Realm

class User: Object {
    @Persisted var id: String = ""
    @Persisted var password: String = ""

    convenience init(number: Int) {
        self.init()
    }
}
