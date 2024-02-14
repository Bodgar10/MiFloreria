//
//  VerifyCodeViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 13/02/24.
//

import Combine
import ProjectUI
import UIKit

class VerifyCodeViewController: MainViewController, UITextFieldDelegate {

    private var codetextFiels: [UITextField] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escribe tu código enviado"
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
        let heightConstraint = stackView.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        return stackView
    }()
    
    private let nextButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Continuar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resendButton: DSButton = {
        let button = DSButton(style: .secondary)
        button.setTitle(with: "Reenviar el código")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.small.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = stackView.heightAnchor.constraint(equalToConstant: 110)
        heightConstraint.isActive = true
        
        let widthConstraint = stackView.widthAnchor.constraint(equalToConstant: 180)
        widthConstraint.isActive = true
        return stackView
    }()

    
    private var resendCodeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
#if DEV
        setupBinding()
#endif
        
    }
    
    // MARK: Public functions
    
    public func configure(
        with numberPhone: String,
        verificationId: String
    ) {
        self.resendCodeLabel.text = "Tu código se enviará al número: \(numberPhone)"
    }
    
    // MARK: Private functions
    
#if DEV
    private func setupBinding() {
        nextButton.didTap.sink { _ in
            // TODO: Send to the next view of the additional info
        }
        .store(in: &cancellables)
        
        resendButton.didTap.sink { _ in
            // TODO: Execute again the service for the authentication with phone
        }
    }
#endif
    
    override func setupUI(){
        view.addSubview(titleLabel)
        view.addSubview(codeStackView)
        view.addSubview(buttonsStackView)
        view.addSubview(resendCodeLabel)
        setupTextFields()
        
        buttonsStackView.addArrangedSubview(nextButton)
        buttonsStackView.addArrangedSubview(resendButton)
        
        titleLabel
            .pin(.top, to: view.safeAreaLayoutGuide, constant: 50)
            .pin(.centerX, to: view.centerXAnchor)
        
        codeStackView
            .pin(.top, yAnchor: titleLabel.bottomAnchor, spacing: .xLarge)
            .pin(.leading, to: view.safeAreaLayoutGuide, spacing: .large)
            .pin(.trailing, to: view.safeAreaLayoutGuide, spacing: -.large)
        
        buttonsStackView
            .pin(.top, yAnchor: codeStackView.bottomAnchor, spacing: .xLarge)
            .pin(.centerX, to: view.centerXAnchor)
        
        resendCodeLabel
            .pin(.top, yAnchor: buttonsStackView.bottomAnchor, spacing: .large)
            .pin(.leading, to: view.safeAreaLayoutGuide, spacing: .large)
            .pin(.trailing, to: view.safeAreaLayoutGuide, spacing: -.large)
        
        
    }
    
    func setupTextFields() {
        for _ in 0..<5 {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = .numberPad
            textField.borderStyle = .roundedRect
            textField.textAlignment = .center
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = DesignSystem.primary?.cgColor
            textField.backgroundColor = DesignSystem.background
            textField.layer.cornerRadius = 10.0
            textField.font = .systemFont(ofSize: 20)
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
