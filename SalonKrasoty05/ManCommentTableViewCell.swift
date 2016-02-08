//
//  ManCommentTableViewCell.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 31.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class ManCommentTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateComment: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
