//
//  AddressViewCell.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 05/05/24.
//

import UIKit

class AddressViewCell: UITableViewCell {

    private var nameAddressTitleLabel : UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Direccion nueva"
        return label
    }()
    
    private var addressStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private var addressLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Paseo de los Sauces , Matlanxincas de los ajolotes del perpetuo socorro de la divina concepcion"
        return label
    }()
    
    private lazy var showAddressButton : UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(">", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(nameAddressTitleLabel)
        contentView.addSubview(addressStackView)
        addressStackView.addArrangedSubview(addressLabel)
        addressStackView.addArrangedSubview(showAddressButton)
        constraintUI()
    }
    
    func constraintUI(){
        nameAddressTitleLabel
            .pin(.top, to: contentView)
            .pin(.centerX, to: contentView)
        
        addressStackView
            .pin(.top, yAnchor: nameAddressTitleLabel.bottomAnchor, spacing: .small)
    }
}
