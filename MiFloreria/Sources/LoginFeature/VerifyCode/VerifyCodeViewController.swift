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

    var viewModel: VerifyPhone & SignIn = SignInViewModel(phoneTracking: PhoneFirebaseTracking())
    private var numberPhone: String = ""
    private var verificationId: String = ""
    
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
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.large.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = stackView.heightAnchor.constraint(equalToConstant: 42)
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
        viewModel.viewDidLoad()
        setupBinding()
#endif
        
    }
    
    // MARK: Public functions
    
    public func configure(
        with numberPhone: String,
        verificationId: String
    ) {
        self.numberPhone = numberPhone
        self.verificationId = verificationId
        self.resendCodeLabel.text = "Tu código se enviará al número: \(numberPhone)"
    }
    
    // MARK: Private functions
    
#if DEV
    private func setupBinding() {
        nextButton.didTap.sink { _ in
            self.showActivityIndicator()
            self.viewModel.signIn(verificationId: self.verificationId, verificationCode: self.getCode())
        }
        .store(in: &cancellables)
        
        viewModel.signInPublisher.sink { _ in
        } receiveValue: { [weak self] result in
            guard let self else { return }
            self.hideActivityIndicator()
            switch result {
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            case .success(let uid):
                if let previousButtonTag = UserDefaults.standard.value(forKey: "previousButtonTag") as? Int {
                    if previousButtonTag == 2 {
                        let additionalInfo = AdditionalInfoSignInViewController()
                        additionalInfo.uid = uid
                        additionalInfo.phone = self.numberPhone
                        additionalInfo.viewModel = AdditionalInfoViewModel(additionalInfoTracking: AdditionalInfoFirebaseTracking())
                        self.navigationController?.pushViewController(additionalInfo, animated: true)
                    }else if previousButtonTag == 1 {
                        self.navigationController?.pushViewController(RecoveryPassViewController(), animated: true)
                    }
                }
            }
        }
        .store(in: &cancellables)

        
        
        resendButton.didTap.sink { [weak self] in
            self?.showActivityIndicator()
            self?.viewModel.verifyPhoneNumber(with: self?.numberPhone)
        }.store(in: &cancellables)
        
        viewModel.verificationPhonePublisher.sink(receiveCompletion: { _ in
        }, receiveValue: { [weak self] result in
            guard let self = self else {return}
            self.hideActivityIndicator()
            switch result {
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            case .success(let verificationId):
                self.verificationId = verificationId
                self.showAlert(with: "Código enviado", and: "Te hemos enviado nuevamente tu código.")
            }
        })
        .store(in: &cancellables)
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
        for _ in 0..<6 {
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
    
    private func getCode() -> String {
        var code: String = ""
        codetextFiels.forEach { textfield in
            code.append(textfield.text ?? "")
        }
        return code
    }

}
