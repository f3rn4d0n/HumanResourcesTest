//
//  ColorModel.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class ColorModel: NSObject {
    var color:UIColor
    var selected:Bool
    
    init(color:UIColor, selected:Bool = false){
        self.color = color
        self.selected = selected
    }
}
