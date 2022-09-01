//
//  TableViewController.swift
//  TerraTest
//
//  Created by Natalia Shevaldina on 04.08.2022.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorInset.right = 20
        tableView.separatorColor = .white
        self.navigationItem.title = "Table"
        self.navigationController?.navigationBar.tintColor = .white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel?.text = "Cell #\(indexPath.row + 1)"
        cell.backgroundColor = .systemGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let translation = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = translation
        
        UIView.animate(withDuration: 0.5, delay: 0.03 * Double(indexPath.row), options: .curveEaseOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
}
