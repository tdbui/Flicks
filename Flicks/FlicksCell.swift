//
//  FlicksCell.swift
//  Flicks
//
//  Created by Tuan Bui on 4/2/17.
//  Copyright © 2017 Tuan Bui. All rights reserved.
//

import UIKit

class FlicksCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    

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
