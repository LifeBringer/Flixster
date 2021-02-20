//
//  MovieCell.swift
//  Flixster
//
//  Created by R Alda on 2021-02-20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
