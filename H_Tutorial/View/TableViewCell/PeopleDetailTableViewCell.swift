//
//  PeopleDetailTableViewCell.swift
//  H_Tutorial
//
//  Created by Admin on 24/03/2022.
//

import UIKit

class PeopleDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblAge:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
