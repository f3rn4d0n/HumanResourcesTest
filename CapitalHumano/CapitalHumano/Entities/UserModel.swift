//
//  UserModel.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    var name:String = ""
    var photo:UIImage?
    var image:String = ""
    var phoneNumber:String = ""
    var birthday:Date = Date()
    var option:optionEnum = .camera
    var genders:[GenderModel] = []
    var favoriteColors:[ColorModel] = []
    
}
