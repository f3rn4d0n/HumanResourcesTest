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
    
    var presenter: PresenterDetailViewProtocol?
    let kCameraCellIdentifier = "CameraTableViewCell"
    let kNameCellIdentifier = "NameTableViewCell"
    let kDateCellIdentifier = "DateTableViewCell"
    let kGenderCellIdentifier = "GenderTableViewCell"
    let kColorCellIdentifier = "ColorTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI(){
        optionsTV.delegate = self
        optionsTV.dataSource = self
        optionsTV.separatorStyle = .none
        optionsTV.translatesAutoresizingMaskIntoConstraints = false
        optionsTV.keyboardDismissMode = .onDrag
        
        let optionCamera = UINib(nibName: kCameraCellIdentifier, bundle: nil)
        optionsTV.register(optionCamera, forCellReuseIdentifier: kCameraCellIdentifier)
        let optionName = UINib(nibName: kNameCellIdentifier, bundle: nil)
        optionsTV.register(optionName, forCellReuseIdentifier: kNameCellIdentifier)
        let optionDate = UINib(nibName: kDateCellIdentifier, bundle: nil)
        optionsTV.register(optionDate, forCellReuseIdentifier: kDateCellIdentifier)
        let optionColor = UINib(nibName: kColorCellIdentifier, bundle: nil)
        optionsTV.register(optionColor, forCellReuseIdentifier: kColorCellIdentifier)
        let optionGender = UINib(nibName: kGenderCellIdentifier, bundle: nil)
        optionsTV.register(optionGender, forCellReuseIdentifier: kGenderCellIdentifier)
    }
    
    func setupData(){
        presenter?.prepareData()
    }
    
    func takeAPicture(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getNumberOfOptions() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.bounds.size.width-20, height: 28))
        headerLabel.textColor = UIColor.white
        headerLabel.backgroundColor = .black
        headerLabel.text = presenter?.getNameBy(index: section)
        headerLabel.textAlignment = .center
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let option = presenter?.getOptionBy(index: section)
        if option == .gender{
            return 2
        }
        if option == .color{
            return presenter?.getNumberOfColors() ?? 0
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter?.getOptionBy(index: indexPath.section) {
        case .photo:
            return 200
        case .camera:
            return 200
        case .name:
            return 40
        case .phone:
            return 40
        case .birthday:
            return 100
        case .gender:
            return 50
        case .color:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter?.getOptionBy(index: indexPath.section) {
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: kCameraCellIdentifier, for: indexPath) as! CameraTableViewCell
            cell.setupFor(photo: presenter!.getUserImage())
            return cell
        case .camera:
            let cell = tableView.dequeueReusableCell(withIdentifier: kCameraCellIdentifier, for: indexPath) as! CameraTableViewCell
            cell.setupFor(camera: presenter?.getUserFoto())
            return cell
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: kNameCellIdentifier, for: indexPath) as! NameTableViewCell
            cell.setupFor(name: presenter!.getUserName())
            return cell
        case .phone:
            let cell = tableView.dequeueReusableCell(withIdentifier: kNameCellIdentifier, for: indexPath) as! NameTableViewCell
            cell.setupFor(phone: presenter!.getUserPhone())
            return cell
        case .birthday:
            let cell = tableView.dequeueReusableCell(withIdentifier: kDateCellIdentifier, for: indexPath) as! DateTableViewCell
            cell.setupWith(birthday: presenter!.getUserAge())
            return cell
        case .gender:
            let cell = tableView.dequeueReusableCell(withIdentifier: kGenderCellIdentifier, for: indexPath) as! GenderTableViewCell
            if let gender = presenter?.getGenderBy(index: indexPath.row){
                cell.setupFor(gender: gender)
            }
            return cell
        case .color:
            let cell = tableView.dequeueReusableCell(withIdentifier: kColorCellIdentifier, for: indexPath) as! ColorTableViewCell
            if let color = presenter?.getColorBy(index: indexPath.row){
                cell.setupBy(color: color)
            }
            return cell
        default:
            break
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kCameraCellIdentifier, for: indexPath) as! CameraTableViewCell
        cell.setupFor(camera: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        switch presenter?.getOptionBy(index: indexPath.section) {
        case .photo:
            print("No hacer nada")
            tableView.deselectRow(at: indexPath, animated: true)
            break
        case .camera:
            self.takeAPicture()
            break
        case .name:
            break
        case .phone:
            break
        case .birthday:
            break
        case .gender:
            presenter?.selectGenderBy(index: indexPath.row)
            tableView.reloadData()
            break
        case .color:
            presenter?.selectColorBy(index: indexPath.row)
            tableView.reloadData()
            break
        default:
            break
        }
    }
}

extension DetailViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        presenter?.setImage(image)
        optionsTV.reloadData()
    }
}

extension DetailViewController: DetailViewProtocol{
}

