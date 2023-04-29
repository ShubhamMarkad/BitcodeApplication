//
//  StudentTableViewCell.swift
//  BitcodeApplication
//
//  Created by Mac on 19/04/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
  //  @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var yearOfPassingLabel: UILabel!
    @IBOutlet weak var quelificationlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
