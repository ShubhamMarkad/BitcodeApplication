//
//  PersonDetailsViewController.swift
//  BitcodeApplication
//
//  Created by Mac on 27/04/23.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    var image = UIImage()
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        personImage.image = image
    }

}
