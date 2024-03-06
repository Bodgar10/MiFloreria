//
//  MainViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 06/02/24.
//

import UIKit

class MainViewController: UIViewController {

    let activityView = UIActivityIndicatorView(style: .large)
    
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
    
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func showActivityIndicator() {
       activityView.center = self.view.center
       view.addSubview(activityView)
       activityView.startAnimating()
   }
    
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}
