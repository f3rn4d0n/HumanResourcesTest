//
//  NameTableViewCell.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtLbl: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupFor(name:String){
        self.txtLbl.text = name
        self.txtLbl.keyboardType = .default
        self.txtLbl.delegate = self
    }
    
    func setupFor(phone:String){
        self.txtLbl.text = phone
        self.txtLbl.keyboardType = .decimalPad
        self.txtLbl.delegate = self
    }
}

extension NameTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //self.view.frame = CGRect(x: 0, y: self.view.frame.minY-100, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.view.frame = CGRect(x: 0, y: self.view.frame.minY+100, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        if textField.keyboardType == .default{
            return newString.length <= 35
        }else{
            return newString.length <= 10
        }
    }
}
