//
//  ReposTableViewController.swift
//  Auth
//
//  Created by Irina Kalashnikova on 9/27/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {

    var names:Array = ["Irina", "Tim", "Katy", "Frank", "Ann", "Natasha", "Glenn", "Kasey", "Frank"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
        
    }
    
    
    

    
}
