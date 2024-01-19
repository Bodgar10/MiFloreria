//
//  DemoTableViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 16/01/24.
//

import UIKit

class DemoTableViewController: UITableViewController {
    
    var demoViews = [(sectionName: String, views: [UIView])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoViews.append(("Components", []))
        demoViews.append(("LogInFeature", []))
        demoViews.append(("FeedFeature", []))
        demoViews.append(("SearchFeature", []))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return demoViews.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoViews[section].views.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return demoViews[section].sectionName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
