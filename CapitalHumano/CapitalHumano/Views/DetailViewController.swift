//
//  DetailViewController.swift
//  CapitalHumano
//
//  Created by Luis Fernando Bustos Ramírez on 18/06/20.
//  Copyright © 2020 com.gastandoTenis.CapitalHumano. All rights reserved.
//

import UIKit

protocol DetailViewProtocol{
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var optionsTV: UITableView!
    
    var presenter:PresenterDetailViewProtocol?
    let kCellIdentifier = "OptionTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
    }
    
}

extension DetailViewController: DetailViewProtocol{
}

