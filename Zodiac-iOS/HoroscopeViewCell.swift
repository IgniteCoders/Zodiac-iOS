//
//  HoroscopeViewCell.swift
//  Zodiac-iOS
//
//  Created by Mañanas on 12/5/25.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    
    func render(horoscope: Horoscope) {
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        signImageView.image = horoscope.image
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
