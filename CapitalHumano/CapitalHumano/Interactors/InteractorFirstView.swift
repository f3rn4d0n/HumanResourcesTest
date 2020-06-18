//
//  InteractorFirstView.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

protocol InteractorFirstViewProtocolInput{
    func getListOfOptions() -> [OptionModel]
}

class InteractorFirstView: InteractorFirstViewProtocolInput {
    func getListOfOptions() -> [OptionModel]{
        return [
            OptionModel(name: "Cámara", image: UIImage.init(named: "camera")!, option: optionEnum.camera),
            OptionModel(name: "Foto", image: UIImage.init(named: "photo")!, option: optionEnum.photo),
            OptionModel(name: "Nombre completo", image: UIImage.init(named: "name")!, option: optionEnum.name),
            OptionModel(name: "Número telefónico", image: UIImage.init(named: "phone")!, option: optionEnum.phone),
            OptionModel(name: "Fecha de nacimiento", image: UIImage.init(named: "cake")!, option: optionEnum.birthday),
            OptionModel(name: "Sexo", image: UIImage.init(named: "gender")!, option: optionEnum.gender),
            OptionModel(name: "Color", image: UIImage.init(named: "color")!, option: optionEnum.color),
        ]
    }
}
