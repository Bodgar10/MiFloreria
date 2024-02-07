//
//  MainViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 06/02/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        setupUI()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func setupUI() {
        fatalError("You need to override into your class to create the contraints.")
    }
}
