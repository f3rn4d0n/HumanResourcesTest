//
//  OptionTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        self.backgroundColor = .white
        selectedView.layer.cornerRadius = selectedView.frame.width / 2
        selectedView.layer.borderColor = UIColor.white.cgColor
        selectedView.layer.borderWidth = 2
    }
    
    func fillWith(option: OptionModel){
        imageView?.image = option.image
        nameLbl.text = option.name
        selectedView.backgroundColor = option.selected ? .red : .white
    }
    
    func fillEmpty(){
        imageView?.image = #imageLiteral(resourceName: "name")
        nameLbl.text = "Not Found"
        selectedView.backgroundColor = .white
    }
    
}
