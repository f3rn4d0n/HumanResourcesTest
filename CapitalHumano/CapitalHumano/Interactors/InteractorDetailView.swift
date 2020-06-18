//
//  InteractorDetailView.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol InteractorDetailViewProtocolInput{
    func getColors() -> [ColorModel]
    func getGenders() -> [GenderModel]
    func getImageURL() -> String
}

class InteractorDetailView: InteractorDetailViewProtocolInput {
    
    var presenter: InteractorDetailViewProtocolOutput?
    
    private let kVegetaImg = "https://http2.mlstatic.com/vegeta-tamano-teal-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"
    
    func getColors() -> [ColorModel]{
        return [
            ColorModel(color: .black),
            ColorModel(color: .green),
            ColorModel(color: .red),
            ColorModel(color: .orange),
            ColorModel(color: .gray),
            ColorModel(color: .blue),
            ColorModel(color: .yellow),
        ]
    }
    
    func getGenders() -> [GenderModel]{
        return [
            GenderModel(gender: "Hombre", selected: true),
            GenderModel(gender: "Mujer", selected: false),
        ]
    }
    
    func getImageURL() -> String{
        return kVegetaImg
    }
}
