//
//  RouterDetailView.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol RouterDetailViewProtocol{
}

class RouterDetailView: RouterDetailViewProtocol {
    
    var view: DetailViewController = DetailViewController()
    let presenter = PresenterDetailView()
    let interactor = InteractorDetailView()
    
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        view = (storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController)!
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
    }
}
