//
//  LeagueTableViewCell.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           configureCell()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           configureCell()
       }
       
       private func configureCell() {
           // Configure the appearance of the cell here
           contentView.layer.borderWidth = 1
           contentView.layer.borderColor = UIColor.gray.cgColor
           contentView.layer.cornerRadius = 50
           contentView.clipsToBounds = true
           // Set the layout margins to add padding
           let padding: CGFloat = 16
           contentView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
       }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
