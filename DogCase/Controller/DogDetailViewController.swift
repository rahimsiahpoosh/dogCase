//
//  DogDetailViewController.swift
//  DogCase
//
//  Created by Rahim Siahpoosh on 2018-08-16.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController {
    
    @IBOutlet var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UITextField!
    
    var dogs = [Dog]()
    var dogImage = ""
    var dogName = ""
    var dogId = ""
    var dogServices = DogServices()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dogName
        dogServices.getDogImage(dogImage: dogImage, dogImageView: dogImageView)
        dogNameLabel.text = dogName
    }

    @IBAction func SaveButton(_ sender: Any) {
        for number in dogs.enumerated() {
            if dogId == number.element.dogId {
                let updateDog = Dog(dogName: self.dogNameLabel.text!, dogImage: self.dogImage , dogId: self.dogId)
                self.dogs[number.offset] = updateDog
            }
        }
    }
}
