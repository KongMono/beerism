//
//  CustomTableViewCell.swift
//  beerism
//
//  Created by Kong Mono on 4/29/16.
//  Copyright © 2016 beerism. All rights reserved.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mPlace: UILabel!
    @IBOutlet weak var mTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
