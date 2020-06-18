//
//  RouterFirstView.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol RouterFirstViewProtocol{
    func goToDetailWith(options:[OptionModel]) 
}

class RouterFirstView: RouterFirstViewProtocol {
        var view: ViewController = ViewController()
        let presenter = PresenterFirstView()
        let interactor = InteractorFirstView()
        var navigationController: UINavigationController?
        
        init() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            view = (storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.routing = self
            navigationController = UINavigationController(rootViewController: view)
        }
        
    func goToDetailWith(options:[OptionModel]) {
        }

}
