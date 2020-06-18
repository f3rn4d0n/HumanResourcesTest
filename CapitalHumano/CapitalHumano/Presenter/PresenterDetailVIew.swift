//
//  PresenterDetailVIew.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol PresenterDetailViewProtocol{
}


protocol InteractorDetailViewProtocolOutput{
}

class PresenterDetailView: PresenterDetailViewProtocol, InteractorDetailViewProtocolOutput {
    
    var view:DetailViewProtocol?
    var interactor:InteractorDetailViewProtocolInput?
    var routing:RouterDetailViewProtocol?
}
