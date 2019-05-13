//
//  TableViewCell.swift
//  CoreDataDemo
//
//  Created by apple on 07/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var stdObj:Student! {
        
        
        didSet {
            
            lblName.text = stdObj.name
            lblMobile.text = stdObj.mobile
            lblAddress.text = stdObj.address
            lblCity.text = stdObj.city
            
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
