//
//  DSLineTF.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 01/02/24.
//

import UIKit
import ProjectUI

final class DSLineTF: UIView {
    
    // MARK: Components
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let lineBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public func configure(
        backgroundLine: UIColor = .gray,
        placeholder: String, 
        keyboardType: UIKeyboardType = .default,
        needsSecurity: Bool = false) {
            lineBaseView.backgroundColor = backgroundLine
            textField.keyboardType = keyboardType
            textField.placeholder = placeholder
            textField.isSecureTextEntry = needsSecurity
    }
    
    private func setupUI() {
        textField.delegate = self
        
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(textField)
        mainStackView.addArrangedSubview(lineBaseView)
        
        lineBaseView.pinSize(to: CGSize(width: mainStackView.frame.width, height: 1))
        mainStackView
            .pinCenter(to: self)
            .pin(.leading, to: self, spacing: .zero)
            .pin(.trailing, to: self, spacing: .zero)
    }
    
}

extension DSLineTF: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
