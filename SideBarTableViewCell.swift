//
//  SideBarTableViewCell.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 03/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var sidebarImageView: UIImageView!
    @IBOutlet weak var sidebarLabel: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
