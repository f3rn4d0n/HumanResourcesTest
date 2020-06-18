//
//  PresenterFirstView.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol PresenterFirstViewProtocol{
    func requestOptions()
    func getNumberOfOptions() -> Int
    func getOptionBy(index:Int) -> OptionModel?
    func selectOption(_ index:Int)
    func goToDetail()
}

class PresenterFirstView: PresenterFirstViewProtocol {
    
    var view:ViewControllerProtocol?
    var interactor:InteractorFirstViewProtocolInput?
    var routing:RouterFirstViewProtocol?
    
    var options:[OptionModel] = []
    
    func requestOptions(){
        options = interactor?.getListOfOptions() ?? []
    }
    
    func getNumberOfOptions() -> Int{
        return options.count
    }
    
    func getOptionBy(index:Int) -> OptionModel?{
        return options[index]
    }
    
    func selectOption(_ index:Int){
        options[index].selected = !options[index].selected
    }
    
    func goToDetail(){
        var available = false
        for option in options{
            if option.selected{
                available = true
            }
        }
        if available{
            routing?.goToDetailWith(options: options)
        }else{
            view?.noneSelected()
        }
        
    }
}
