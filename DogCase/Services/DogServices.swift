//
//  DogServices.swift
//  DogCase
//
//  Created by Rahim Siahpoosh on 2018-08-16.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import Foundation
import UIKit

class DogServices {
    
    init() {
        print("DogServices created! :)")
    }
    
    func parseJsonData(data: Data) -> [Dog] {
        var dogs = [Dog]()
        var dogNr = 0
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            let jsonDogs = jsonResult?["message"] as! [AnyObject]
            for jsonDog in jsonDogs {
                dogNr += 1
                print("hej \(jsonDog)")
                let dog = Dog(dogName: "Dog \(dogNr)", dogImage: jsonDog as! String, dogId: "\(dogNr)")
                dogs.append(dog)
            }
            
        } catch {
            print(error)
        }
        
        return dogs
    }
    
    func getDogImage(dogImage: String, dogImageView: UIImageView) {
        let dogUrlImage = URL(string: dogImage)
        
        let dogRequestImage = URLRequest(url: dogUrlImage!)
        
        let getDogImageFromUrl = URLSession.shared.dataTask(with: dogRequestImage) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let dogImage = data {
                let image = UIImage(data: dogImage)
                DispatchQueue.main.async {
                    dogImageView.image = image
                }
            } else {
                print("image file is knas")
            }
        }
        getDogImageFromUrl.resume()
    }
}
