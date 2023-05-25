//
//  DetailsTableViewCell.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 24/05/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var awayResult: UILabel!
    @IBOutlet weak var homeResult: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
