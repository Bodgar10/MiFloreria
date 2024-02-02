//
//  PhoneViewController.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 29/01/24.
//

import Foundation
import UIKit


class PhoneViewController : UIViewController {
    
    private var singInLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registrate"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var phoneStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = . horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    private var codeCountryStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.cornerRadius = 5
        return stack
    }()
    
    private var flagImageView : UIImageView = {
      let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bandera")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var codePhoneLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+52"
        return label
    }()
    
    private var phoneTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "7293055678"
        return text
    }()
    
    private var lineBaseView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nextButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Siguiente", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .red
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(singInLabel)
        view.addSubview(phoneStackView)
        view.addSubview(lineBaseView)
        view.addSubview(nextButton)
        
        phoneStackView.addArrangedSubview(codeCountryStackView)
        phoneStackView.addArrangedSubview(phoneTextField)
        
        codeCountryStackView.addArrangedSubview(flagImageView)
        codeCountryStackView.addArrangedSubview(codePhoneLabel)
        
        NSLayoutConstraint.activate([
            
            singInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            singInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            phoneStackView.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 50),
            phoneStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            phoneStackView.heightAnchor.constraint(equalToConstant: 50),
            
            codeCountryStackView.widthAnchor.constraint(equalToConstant: 80),
            
            flagImageView.widthAnchor.constraint(equalToConstant: 25),
            flagImageView.heightAnchor.constraint(equalToConstant: 25),
            
            flagImageView.leadingAnchor.constraint(equalTo: codeCountryStackView.leadingAnchor, constant: 10),
            
            codePhoneLabel.trailingAnchor.constraint(equalTo: codeCountryStackView.trailingAnchor, constant: -10),
            
            
            lineBaseView.topAnchor.constraint(equalTo: phoneStackView.bottomAnchor, constant: 20),
            lineBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineBaseView.heightAnchor.constraint(equalToConstant: 1),
            
            nextButton.topAnchor.constraint(equalTo: lineBaseView.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 45),

        ])
    }
}
