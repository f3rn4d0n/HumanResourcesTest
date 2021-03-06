//
//  PresenterDetailVIew.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit


protocol PresenterDetailViewProtocol{
    func prepareData()
    func getNumberOfOptions() -> Int
    func getOptionBy(index:Int) -> optionEnum
    func getNameBy(index:Int) -> String
    func getUserImage() -> String
    func getUserFoto() -> UIImage?
    func getUserName() -> String
    func getUserPhone() -> String
    func getUserAge() -> Date
    func setImage(_ image:UIImage)
    func setBirthday(_ date:Date)
    func shouldSetName(_ name: String) -> Bool
    func shouldSetPhone(_ phone:String) -> Bool
    func getNumberOfColors() -> Int
    func getColorBy(index:Int) -> ColorModel
    func selectColorBy(index:Int)
    func getNumberOfGenders() -> Int
    func getGenderBy(index:Int) -> GenderModel
    func selectGenderBy(index:Int)
}


protocol InteractorDetailViewProtocolOutput{
}

class PresenterDetailView: PresenterDetailViewProtocol, InteractorDetailViewProtocolOutput {
    
    var view:DetailViewProtocol?
    var interactor:InteractorDetailViewProtocolInput?
    var routing:RouterDetailViewProtocol?
    
    var options:[OptionModel] = []
    var user:UserModel = UserModel()
    
    //Fill info
    func prepareData() {
        user.favoriteColors = interactor?.getColors() ?? []
        user.genders = interactor?.getGenders() ?? []
    }
    
    //Get Info
    func getNumberOfOptions() -> Int{
        return options.count
    }
    
    func getOptionBy(index:Int) -> optionEnum{
        return options[index].option
    }
    
    func getNameBy(index:Int) -> String{
        return options[index].name
    }
    
    func getUserImage() -> String {
        return interactor?.getImageURL() ?? ""
    }
    
    func getUserFoto() -> UIImage?{
        return user.photo
    }
    
    func getUserName() -> String{
        return user.name
    }
    
    func getUserPhone() -> String {
        return user.phoneNumber
    }
    
    func getUserAge() -> Date{
        return user.birthday
    }
    
    //Update info
    func setImage(_ image:UIImage){
        user.photo = image
    }
    
    func setBirthday(_ date:Date){
        user.birthday = date
    }
    
    func shouldSetName(_ name: String) -> Bool {
        if name.count <= 35{
            user.name = name
            return true
        }
        return false
    }

    func shouldSetPhone(_ phone: String) -> Bool {
        if phone.count <= 10{
            user.phoneNumber = phone
            return true
        }
        return false
    }
    
    //Colors
    func getNumberOfColors() -> Int{
        return user.favoriteColors.count
    }
    
    func getColorBy(index:Int) -> ColorModel{
        return user.favoriteColors[index]
    }
    
    func selectColorBy(index:Int){
        user.favoriteColors[index].selected = !user.favoriteColors[index].selected
    }
    
    //Gender
    func getNumberOfGenders() -> Int{
        return user.genders.count
    }
    
    func getGenderBy(index:Int) -> GenderModel{
        return user.genders[index]
    }
    
    func selectGenderBy(index:Int){
        for i in 0...user.genders.count - 1{
            user.genders[i].selected = index == i
        }
    }
}
