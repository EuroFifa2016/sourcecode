//
//  StandingCell.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 12/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class StandingCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var plusMinusLabel: UILabel!
    @IBOutlet weak var matchPlayedLabel: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
