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
    
    private lazy var addAddressButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        return button
    }()
    
    private var listAddressTable: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .red
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
            .pin(.leading, to: view, constant: 10)
            .pin(.trailing, to: view, constant: -10)

        listAddressTable
            .pin(.top, yAnchor: addressStack.bottomAnchor, spacing: .small)
            .pin(.leading, to: view, constant: 10)
            .pin(.trailing, to: view, constant: -10)
            .pin(.bottom, to: view)

    }
}

struct ListPreviewAddressSaveViewController : PreviewProvider {
    static var previews: some View {
        VCPreview { ListAddressSaveViewController()}
    }
    
}

extension ListAddressSaveViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listAddressTable.dequeueReusableCell(withIdentifier: "AddressViewCell", for: indexPath) as? AddressViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
