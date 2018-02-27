//
//  PhotoCell.swift
//  Instagram
//
//  Created by Haimei Yang on 2/26/18.
//  Copyright © 2018 Haimei Yang. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var InstaPhoto: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
