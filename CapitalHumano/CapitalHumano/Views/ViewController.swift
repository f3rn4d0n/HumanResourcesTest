//
//  ViewController.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit



protocol ViewControllerProtocol{
    func noneSelected()
}


class ViewController: UIViewController {

    @IBOutlet weak var optionsTV: UITableView!
    @IBOutlet weak var continueBtn: UIButton!
    
    var presenter:PresenterFirstViewProtocol?
    let kCellIdentifier = "OptionTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI(){
        optionsTV.delegate = self
        optionsTV.dataSource = self
        optionsTV.separatorStyle = .none
        
        let optionNib = UINib(nibName: kCellIdentifier, bundle: nil)
        optionsTV.register(optionNib, forCellReuseIdentifier: kCellIdentifier)
        
        continueBtn.layer.cornerRadius = continueBtn.frame.height / 2
        continueBtn.backgroundColor = .systemGreen
        continueBtn.tintColor = .white
        
        self.navigationItem.title = "Seleccione una opción"
    }
    
    func setupData(){
        presenter?.requestOptions()
    }


    @IBAction func continueAction(_ sender: Any) {
        presenter?.goToDetail()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfOptions() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! OptionTableViewCell
        cell.setupUI()
        if let option = presenter?.getOptionBy(index: indexPath.row){
            cell.fillWith(option: option)
        }else{
            cell.fillEmpty()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectOption(indexPath.row)
        optionsTV.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: ViewControllerProtocol{
    func noneSelected() {
        let alert = UIAlertController(title: "Error", message: "Favor de seleccionar al menos una opción", preferredStyle: .alert)
        let accept = UIAlertAction(title: "Aceptar", style: .default) { (_) in}
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
}
