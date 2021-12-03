//
//  ViewController.swift
//  RoboGen2
//
//  Created by Franciszek Baron on 03/12/2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    let uuids: [UUID] = {
        (0..<20).map{ _ in UUID() }
    }()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uuids.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") else {
            fatalError()
        }
        let uuidString = uuids[indexPath.row].uuidString
        cell.imageView?.sd_setImage(with: URL(string: "https://robohash.org/\(uuidString).png")) { _,_,_,_ in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        cell.textLabel?.text = uuidString
        return cell
    }
}

