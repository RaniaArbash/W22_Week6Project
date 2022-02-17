//
//  CarTableViewCell.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var carYear: UILabel!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
