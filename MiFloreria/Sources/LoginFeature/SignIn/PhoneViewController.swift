//
//  PhoneViewController.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 01/02/24.
//

import Combine
import UIKit
import ProjectUI

final class PhoneViewController : UIViewController {
   
   private var cancellables: Set<AnyCancellable> = []
    
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
       text.keyboardType = .numberPad
       return text
   }()
   
   private var lineBaseView : UIView = {
       let view = UIView()
       view.backgroundColor = UIColor(named: "DSGray")
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
        view.backgroundColor = UIColor(named: "DSBackground")
        setupUI()
#if DEV
        setupBinding()
#endif
   }
   
#if DEV
    private func setupBinding() {
        nextButton.didTap.sink { _ in
            // TODO: Send to the next view of the signin
        }
        .store(in: &cancellables)
    }
#endif
    
   private func setupUI(){
       view.addSubview(singInLabel)
       view.addSubview(phoneStackView)
       view.addSubview(lineBaseView)
       view.addSubview(nextButton)
       
       phoneStackView.addArrangedSubview(codeCountryStackView)
       phoneStackView.addArrangedSubview(phoneTextField)
       
       codeCountryStackView.addArrangedSubview(flagImageView)
       codeCountryStackView.addArrangedSubview(codePhoneLabel)
       
       singInLabel
           .pin(.top, to: view.safeAreaLayoutGuide, constant: 50)
           .pin(.centerX, to: view.centerXAnchor)
       
       phoneStackView
           .pin(.top, yAnchor: singInLabel.bottomAnchor, spacing: .medium)
           .pin(.leading, to: view , constant: 30)
           .pin(.trailing, to: view, constant: -30)
           .pinSize(to: 50)
       
       codeCountryStackView
           .pinSize(to: 80)
       
       flagImageView
           .pinSize(to: 25)
           .pin(.leading, to: codeCountryStackView, constant: 10)
       
       codePhoneLabel
           .pin(.trailing, to: codeCountryStackView, constant: -10)
       
       
       lineBaseView
           .pin(.top, yAnchor: phoneStackView.bottomAnchor, spacing: .small)
           .pin(.leading, to: view, constant: 20)
           .pin(.trailing, to: view, constant: -20)
           .pinSize(to: 1)
       
       nextButton
           .pin(.top, yAnchor: lineBaseView.bottomAnchor, spacing: .medium)
           .pin(.centerX, to: view)
           .pinSize(to: CGSize(width: 100, height: 45))
       
       NSLayoutConstraint.activate([
           


       ])
   }
}