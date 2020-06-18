//
//  GenderTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class GenderTableViewCell: UITableViewCell {

    @IBOutlet weak var mainColor: UIView!
    @IBOutlet weak var imageOption: UIImageView!
    @IBOutlet weak var genderLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupFor(gender:GenderModel){
        genderLbl.text = gender.gender
        genderLbl.textColor =  gender.selected ? .white : .black
        imageOption.backgroundColor = gender.selected ? .white : .clear
        imageOption.layer.cornerRadius = imageOption.frame.width/2
        imageOption.layoutIfNeeded()
        mainColor.layer.cornerRadius = 5
        mainColor.layer.borderColor = UIColor.blue.cgColor
        mainColor.layer.borderWidth = 2
        mainColor.layoutIfNeeded()
        mainColor.backgroundColor = gender.selected ? .blue : .white
    }
}
