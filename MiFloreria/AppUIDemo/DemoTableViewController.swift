//
//  DemoTableViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 16/01/24.
//
import Combine
import UIKit

// Massive View Controller (MVC)

class DemoTableViewController: UITableViewController {
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return DemoUI.demoViews.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DemoUI.demoViews[section].views.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DemoUI.demoViews[section].section.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = DemoUI.demoViews[indexPath.section].views[indexPath.row].name
        config.textProperties.font = UIFont.systemFont(ofSize: 20)
        cell.contentConfiguration = config
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = DemoUI.demoViews[indexPath.section]
        let view = section.views[indexPath.row]
        let viewController = view.viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
