//
//  PrimaryButton.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 18/01/24.
//

import UIKit
import Combine

class PrimaryButton: UIView {
    
    // MARK: Private UI
    
    private let primaryButton: DSButton = {
        let button = DSButton(style: primary)
        return button
    }()

    // MARK: Public Variables
    
    var buttonTapPublisher: AnyPublisher<Void, Never> {
        return primaryButton.publisher(for: .touchUpInside)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
    
    // MARK: Public initializers
    
    convenience init(title: String, backgroundColor: UIColor = .systemPink) {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
