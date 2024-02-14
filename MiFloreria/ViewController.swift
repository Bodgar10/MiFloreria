//
//  ViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 16/01/24.
//

import Combine
import ProjectUI
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
   
    private var codetextFiels: [UITextField] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escribe tú código enviado"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let codeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.large.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nextButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Contunuar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var codeTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.keyboardType = .numberPad
        return text
    }()
    
    private let resendButton: DSButton = {
        let button = DSButton(style: . secondary)
        button.setTitle("Reenviar el código", for: .normal)
        return button
    }()
    
  
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.small.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "DSBackground")
        setupUI()
#if DEV
        setupBinding()
#endif
        
    }
    
    // MARK: Private functions
    
#if DEV
    private func setupBinding() {
        nextButton.didTap.sink { _ in
            // TODO: Send to the next view of the signin
        }
        .store(in: &cancellables)
    }
#endif
    
    private func setupUI(){
        view.addSubview(titleLabel)
        view.addSubview(resendButton)
        view.addSubview(nextButton)
        setupTextFields()
        
        codeStackView.addArrangedSubview(codeTextField)
        
        buttonsStackView.addArrangedSubview(nextButton)
        buttonsStackView.addArrangedSubview(resendButton)
        
        titleLabel
            .pin(.top, to: view.safeAreaLayoutGuide, constant: 50)
            .pin(.centerX, to: view.centerXAnchor)
        
        
        buttonsStackView.pinSize(to: CGSize(width: titleLabel.frame.width, height: 30))
        
        
      
        
        
        NSLayoutConstraint.activate([
            


        ])
        
        
    }
    
    func setupTextFields() {
        for _ in 0..<5 {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = .numberPad
            textField.borderStyle = .roundedRect
            textField.textAlignment = .center
            textField.delegate = self
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            codetextFiels.append(textField)
            codeStackView.addArrangedSubview(textField)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.count == 1 {
            for (index, currentTextField) in codetextFiels.enumerated() {
                if currentTextField == textField, index < codetextFiels.count - 1 {
                    codetextFiels[index + 1].becomeFirstResponder()
                    break
                }
            }
        }
    }
    
   
}

