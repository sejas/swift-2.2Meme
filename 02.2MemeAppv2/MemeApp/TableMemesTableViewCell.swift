//
//  TableMemesTableViewCell.swift
//  MemeApp
//
//  Created by Antonio Sejas on 26/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class TableMemesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMeme: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
