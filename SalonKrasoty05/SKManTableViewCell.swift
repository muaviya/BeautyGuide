//
//  SKManTableViewCell.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 30.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class SKManTableViewCell: UITableViewCell {

    @IBOutlet weak var SKManImage: UIImageView!
    @IBOutlet weak var SKManLocationLabel: UILabel!
    @IBOutlet weak var SKManNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
