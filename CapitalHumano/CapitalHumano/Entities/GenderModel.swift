//
//  GenderModel.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class GenderModel: NSObject {
    var gender:String
    var selected:Bool
    
    init(gender:String, selected:Bool){
        self.gender = gender
        self.selected = selected
    }
}
