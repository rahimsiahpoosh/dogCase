//
//  DogTableViewCell.swift
//  DogCase
//
//  Created by Rahim Siahpoosh on 2018-08-15.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet weak var dogNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
