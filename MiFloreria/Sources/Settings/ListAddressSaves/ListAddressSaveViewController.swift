//
//  List.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 03/05/24.
//

import Foundation
import UIKit
import SwiftUI

class ListAddressSaveViewController : UIViewController {
    
    private let titleAddressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Direcciones guardadas"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let viewAddAddress: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addressStack: UIStackView = {
        let address = UIStackView()
        address.axis = .horizontal
        address.distribution = .fillProportionally
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()
    
    private let addAddressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Agregar direccion"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var addAddressButton : UIImageView = {
       let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(named: "add.blue.icon")
        return button
    }()
    
    private var listAddressTable: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .dsBackground
        listAddressTable.backgroundColor = .dsBackground
        listAddressTable.delegate = self
        listAddressTable.dataSource = self
        listAddressTable.register(AddressViewCell.self, forCellReuseIdentifier: "AddressViewCell")
        setupUI()
        
    }
    
    func setupUI(){
        view.addSubview(titleAddressLabel)
        view.addSubview(addressStack)
        view.addSubview(listAddressTable)
        addressStack.addArrangedSubview(addAddressLabel)
        addressStack.addArrangedSubview(addAddressButton)
        constraintsUI()
    }
    
    fileprivate func constraintsUI(){
        titleAddressLabel
            .pin(.top, to: view.safeAreaLayoutGuide, constant: 15)
            .pin(.centerX, to: view.centerXAnchor)
        
        addressStack
            .pin(.top, yAnchor: titleAddressLabel.bottomAnchor, spacing: .small)
            .pin(.leading, to: view, constant: 20)
            .pin(.trailing, to: view, constant: -20)
        
        listAddressTable
            .pin(.top, yAnchor: addressStack.bottomAnchor, spacing: .small)
            .pin(.leading, to: view, spacing: .zero)
            .pin(.trailing, to: view, spacing: .zero)
            .pin(.bottom, to: view, constant: -10)
        
        addAddressButton
        .pinSize(to:CGSize(width: 25, height: 25))

    }
}

struct ListPreviewAddressSaveViewController : PreviewProvider {
    static var previews: some View {
        VCPreview { ListAddressSaveViewController()}
    }
    
}

extension ListAddressSaveViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listAddressTable.dequeueReusableCell(withIdentifier: "AddressViewCell", for: indexPath) as? AddressViewCell else {
            return UITableViewCell()
            
        }
        let trashButton = UIButton(type: .custom)
        trashButton.setImage(UIImage(named: "trash.fill"), for: .normal)
        trashButton.setTitle("", for: .normal)
        cell.editingAccessoryView = trashButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "trash.fill")
            deleteAction.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }

}
