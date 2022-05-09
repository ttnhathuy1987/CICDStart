//
//  People.swift
//  H_Tutorial
//
//  Created by Admin on 11/03/2022.
//

import Foundation

struct People {
    var name: String = ""
    var age: Int = 0
    var address: String?

    init(age: Int) {
        self.name = "default name"
        self.address = "default address"
        self.age = age + 1
    }
}
