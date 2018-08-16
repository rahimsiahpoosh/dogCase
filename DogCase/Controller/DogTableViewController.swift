//
//  DogTableViewController.swift
//  DogCase
//
//  CCreated by Rahim Siahpoosh on 2018-08-16.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class DogTableViewController: UITableViewController {
    
    let randomDogURL = "https://dog.ceo/api/breeds/image/random/10"
    var dogs = [Dog]()
    var dogImage = ""
    var dogServices = DogServices()
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Dogs!"
        if dogs.isEmpty{
            getRandomDogs(randomDogURL: randomDogURL)
        } else {
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindToDogTableViewController(sender: UIStoryboardSegue) {
        if sender.source is DogDetailViewController {
            if let senderVC = sender.source as? DogDetailViewController {
                dogs = senderVC.dogs
            }
        }
    }

    func getRandomDogs(randomDogURL: String) {
        
        guard let randomDogURL = URL(string: randomDogURL) else {
            return
        }
        
        let dogRequest = URLRequest(url: randomDogURL)
            let dogTask = URLSession.shared.dataTask(with: dogRequest) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                if let data = data {
                    self.dogs = self.dogServices.parseJsonData(data: data)
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                }
            }
            dogTask.resume()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DogTableViewCell
        cell.dogNameLabel.text = dogs[indexPath.row].dogName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDogDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DogDetailViewController
                    destinationController.dogImage = dogs[indexPath.row].dogImage
                    destinationController.dogName = dogs[indexPath.row].dogName
                    destinationController.dogId = dogs[indexPath.row].dogId
                    destinationController.dogs = dogs
            }
        }
    }
}
