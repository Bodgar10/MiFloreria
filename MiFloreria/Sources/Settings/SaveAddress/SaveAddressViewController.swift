//
//  SaveAddress.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 14/04/24.
//

import Foundation
import UIKit


final class SaveAddressViewController : UIViewController {
    
    private var stackAddress : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.backgroundColor = .white
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var stackStreet : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelStreet : UILabel = {
     let label = UILabel()
        label.text = "Calle"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldStreet : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackOutDoorNumber : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private var labelOutDoorNumber : UILabel = {
     let label = UILabel()
        label.text = "Numero exterior :"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldOutDoorNumber : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackInternalNumber : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelInternalNumber : UILabel = {
     let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let text = "Numero interior : "
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "(Opcional)")
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 13), range: range)
        label.attributedText = attributedString
        return label
    }()
    
    private var textFieldInternalNumber : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackReference : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelReference : UILabel = {
     let label = UILabel()
        label.text = "Referencias"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldReference : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackBetweenStreet : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelBetweenStreet : UILabel = {
     let label = UILabel()
        label.text = "Entre calles : (Opcional)"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldBetweenStreet : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackZipCode : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelZipCode : UILabel = {
     let label = UILabel()
        label.text = "Codigo Postal"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldZipCode : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var stackColony : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelColony : UILabel = {
     let label = UILabel()
        label.text = "Colonia"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textFieldColony : DSLineTF = {
       let text = DSLineTF()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()    
    

    private var stackState : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelState : UILabel = {
        let label = UILabel()
           label.text = "Estado"
           label.font = UIFont.boldSystemFont(ofSize: 13)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private var textFieldState : DSLineTF = {
          let text = DSLineTF()
           text.translatesAutoresizingMaskIntoConstraints = false
           return text
       }()
    
    private var stackTownHall : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var labelTownHall : UILabel = {
        let label = UILabel()
           label.text = "Alcaldia"
           label.font = UIFont.boldSystemFont(ofSize: 13)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private var textFieldTownHall : DSLineTF = {
          let text = DSLineTF()
           text.translatesAutoresizingMaskIntoConstraints = false
           return text
       }()
    
    private var buttonSave : DSButton = {
        let button = DSButton(style: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Guardar Direccion" , for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }
    
    private func setupUI() {
        
        view.addSubview(stackAddress)
        view.addSubview(buttonSave)
        stackAddress.addArrangedSubview(stackStreet)
        stackAddress.addArrangedSubview(stackOutDoorNumber)
        stackAddress.addArrangedSubview(stackInternalNumber)
        stackAddress.addArrangedSubview(stackReference)
        stackAddress.addArrangedSubview(stackBetweenStreet)
        stackAddress.addArrangedSubview(stackZipCode)
        stackAddress.addArrangedSubview(stackColony)
        stackAddress.addArrangedSubview(stackState)
        stackAddress.addArrangedSubview(stackTownHall)
        
        
        stackStreet.addArrangedSubview(labelStreet)
        stackStreet.addArrangedSubview(textFieldStreet)
        
        stackOutDoorNumber.addArrangedSubview(labelOutDoorNumber)
        stackOutDoorNumber.addArrangedSubview(textFieldOutDoorNumber)
        
        stackInternalNumber.addArrangedSubview(labelInternalNumber)
        stackInternalNumber.addArrangedSubview(textFieldInternalNumber)
       
        stackReference.addArrangedSubview(labelReference)
        stackReference.addArrangedSubview(textFieldReference)
        
        stackBetweenStreet.addArrangedSubview(labelBetweenStreet)
        stackBetweenStreet.addArrangedSubview(textFieldBetweenStreet)
        
        stackZipCode.addArrangedSubview(labelZipCode)
        stackZipCode.addArrangedSubview(textFieldZipCode)
        
        stackColony.addArrangedSubview(labelColony)
        stackColony.addArrangedSubview(textFieldColony)
        
        stackState.addArrangedSubview(labelState)
        stackState.addArrangedSubview(textFieldState)
        
        stackTownHall.addArrangedSubview(labelTownHall)
        stackTownHall.addArrangedSubview(textFieldTownHall)
        
        contraintsUI()
    }
    
    fileprivate func contraintsUI(){

        stackAddress
            .pin(.top, to:view.safeAreaLayoutGuide, constant: 15)
            .pin(.leading, to: view ,constant: 15)
            .pin(.trailing, to: view, constant: -15)
            .pin(.bottom, yAnchor: buttonSave.topAnchor, offset: -35)
        
        buttonSave
            .pin(.bottom, to: view.safeAreaLayoutGuide, constant: -20)
            .pin(.centerX, to: stackAddress)
            .pinSize(to: CGSize(width: 200, height: 50))

    }
}
