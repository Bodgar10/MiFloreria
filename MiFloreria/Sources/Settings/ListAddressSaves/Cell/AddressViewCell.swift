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
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        label.numberOfLines = 0
        label.text = "Paseo de los Sauces #9 col Casa Blanca Metepec"
        return label
    }()
    
    private lazy var showAddressButton : UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(named: "right.red")
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
        self.layer.cornerRadius = 8 
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false 
        contentView.addSubview(nameAddressTitleLabel)
        contentView.addSubview(addressStackView)
        addressStackView.addArrangedSubview(addressLabel)
        addressStackView.addArrangedSubview(showAddressButton)
        constraintUI()
    }
    
    func constraintUI(){
        nameAddressTitleLabel
            .pin(.top, to: contentView, spacing: .small)
            .pin(.leading, to:contentView, constant: 5)
            .pin(.trailing, to: contentView, constant: -5)
        nameAddressTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        
        addressStackView
            .pin(.top, yAnchor: nameAddressTitleLabel.bottomAnchor ,spacing: .medium)
            .pin(.leading, to: contentView, constant: 5)
            .pin(.trailing, to: contentView, constant: -5)
            .pin(.bottom, yAnchor: contentView.bottomAnchor, spacing: .zero)
        
        showAddressButton.widthAnchor.constraint(equalTo: addressStackView.widthAnchor, multiplier: 0.2).isActive = true
        
    }
}
