//
//  NameTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

enum labelTypeTag : Int{
    case phone = 1002
    case name = 1001
}

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtLbl: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupFor(name:String){
        self.txtLbl.text = name
        self.txtLbl.keyboardType = .default
        self.txtLbl.autocorrectionType = .no
        self.txtLbl.tag = labelTypeTag.name.rawValue
    }
    
    func setupFor(phone:String){
        self.txtLbl.text = phone
        self.txtLbl.keyboardType = .decimalPad
        self.txtLbl.autocorrectionType = .no
        self.txtLbl.tag = labelTypeTag.phone.rawValue
    }
}
