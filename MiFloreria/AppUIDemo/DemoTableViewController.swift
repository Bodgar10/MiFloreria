//
//  DemoTableViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 16/01/24.
//
import Combine
import UIKit

// Massive View Controller (MVC)

final class DemoUI {
    
    enum Sections: String {
        case components = "Components"
        case loginFeatures = "LoginFeature"
        case feedFeature = "FeedFeature"
        case searchFeature = "SearchFeature"
    }
    
    var demoViews: [Sections] =
    [
        .components, 
        .loginFeatures,
        .feedFeature,
        .searchFeature,
    ]
}

class DemoTableViewController: UITableViewController {
    private var cancellables: Set<AnyCancellable> = []
    var demoViews = [(sectionName: String, nameComponents: [String])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoViews.append(("Components", ["Buttons", "Carousel Collection View"]))
        demoViews.append(("LoginFeature", ["FirstVC", "PhoneViewController", "VerifyCodeViewController"]))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return demoViews.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoViews[section].nameComponents.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return demoViews[section].sectionName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = demoViews[indexPath.section].nameComponents[indexPath.row]
        config.textProperties.font = UIFont.systemFont(ofSize: 20)
        cell.contentConfiguration = config
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
