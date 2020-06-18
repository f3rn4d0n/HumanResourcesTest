//
//  OptionModel.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

enum optionEnum{
    case camera
    case photo
    case name
    case phone
    case birthday
    case gender
    case color
}

class OptionModel: NSObject {
    var name:String
    var selected:Bool
    var image:UIImage
    var option:optionEnum
    
    init(name:String, selected:Bool = false, image:UIImage, option:optionEnum){
        self.name = name
        self.selected = selected
        self.image = image
        self.option = option
        
    }
}
