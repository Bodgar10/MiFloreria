//
//  DemoButtonsTableViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 23/01/24.
//

import UIKit
import Combine

class DemoButtonsTableViewController: UITableViewController {

    private var cancellables: Set<AnyCancellable> = []
    
    enum TypeButton: String {
        case primary = "Primary Button"
        case secondary = "Secondary Button"
    }
    
    typealias Button = (type: TypeButton, titles: [String])
    
    var buttons: [Button] = 
    [
        (.primary, ["Entrar", "Siguiente", "Continuar"]),
        (.secondary, ["Reenviar el código"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PrimaryButtonTableViewCell.self, forCellReuseIdentifier: "PrimaryButtonTableViewCell")
        tableView.register(SecondaryButtonTableViewCell.self, forCellReuseIdentifier: "SecondaryButtonTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return buttons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return buttons[section].titles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return buttons[section].type.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let button = buttons[indexPath.section]
        
        if button.type == .primary, 
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrimaryButtonTableViewCell", for: indexPath) as? PrimaryButtonTableViewCell {
            let title = button.titles[indexPath.row]
            cell.set(title: button.titles[indexPath.row])
            cell.primaryButton.didTap.sink { _ in
                self.showAlert(with: "We tapped to: \(title)")
            }
            .store(in: &cancellables)
            return cell
        } else if button.type == .secondary, 
                    let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryButtonTableViewCell", for: indexPath) as? SecondaryButtonTableViewCell {
            let title = button.titles[indexPath.row]
            cell.set(title: title)
            cell.secondaryButton.didTap.sink { _ in
                self.showAlert(with: "We tapped to: \(title)")
            }
            .store(in: &cancellables)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "Button tapped", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
