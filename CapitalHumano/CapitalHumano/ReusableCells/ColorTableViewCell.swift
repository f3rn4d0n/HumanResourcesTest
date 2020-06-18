//
//  ColorTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainColor: UIView!
    @IBOutlet weak var selectedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupBy(color:ColorModel){
        self.backgroundColor = .white
        selectedView.layer.cornerRadius = selectedView.frame.width / 2
        selectedView.layer.borderColor = UIColor.white.cgColor
        selectedView.layer.borderWidth = 2
        mainColor.backgroundColor = color.color
        mainColor.layer.cornerRadius = 5
        selectedView.backgroundColor = color.selected ? .red : .white
    }
    
}
