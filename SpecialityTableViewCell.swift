//
//  SpecialityTableViewCell.swift
//  dtapi
//
//  Created by Volodymyr on 10/18/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class SpecialityTableViewCell: UITableViewCell {

    @IBOutlet weak var specialityNameLabel: UILabel!
    @IBOutlet weak var specialityCodeLabel: UILabel!
    @IBOutlet weak var specialityIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
