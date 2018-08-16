//
//  Dog.swift
//  DogCase
//
//  Created by Rahim Siahpoosh on 2018-08-15.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import Foundation

class Dog {
    var dogName: String = ""
    var dogImage: String = ""
    var dogId: String = ""
    
    
    init(dogName: String, dogImage: String, dogId: String) {
        self.dogName = dogName
        self.dogImage = dogImage
        self.dogId = dogId
    }
    
    convenience init() {
        self.init(dogName: "", dogImage: "", dogId: "")
    }
}
