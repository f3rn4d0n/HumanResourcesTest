//
//  CameraTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class CameraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupFor(camera:UIImage?){
        if camera != nil{
            imageV?.image = camera!
        }else{
            imageV?.image = #imageLiteral(resourceName: "camera")
        }
        imageV.isUserInteractionEnabled = true
        
    }
    
    func setupFor(photo:String){
        imageV.isUserInteractionEnabled = false
    }
}
