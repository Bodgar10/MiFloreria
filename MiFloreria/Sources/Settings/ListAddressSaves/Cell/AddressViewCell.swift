//
//  AddressViewCell.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 05/05/24.
//

import UIKit

class AddressViewCell: UITableViewCell {

    private var separeCell: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
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
        stack.axis = .vertical
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
    
    private lazy var showAddressImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "right.red")
        image.contentMode = .scaleAspectFit
        return image
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
        contentView.addSubview(addressStackView)
        addressStackView.addArrangedSubview(nameAddressTitleLabel)
        addressStackView.addArrangedSubview(addressLabel)
        contentView.addSubview(showAddressImageView)
        //contentView.addSubview(separeCell)
        constraintUI()
    }
    
    func constraintUI(){
        
        addressStackView
            .pin(.top, yAnchor: contentView.topAnchor ,spacing: .zero)
            .pin(.leading, to: contentView, constant: 5)
            .pin(.bottom, yAnchor: contentView.bottomAnchor, spacing: .zero)
        addressStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        showAddressImageView
            .pin(.top, yAnchor: contentView.topAnchor, spacing: .xLarge)
            .pin(.leading, to: addressStackView.trailingAnchor)
            .pin(.trailing, to: contentView.trailingAnchor, spacing: .small)
            
        showAddressImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        showAddressImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        
    }
}
