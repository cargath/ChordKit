//
//  ChordTableViewController.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit
import ChordKit

class ChordTableViewController: UIViewController {

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero)
    }()

    lazy var data: [Chord] = {
        return [
            Chord(name: "", notes: "22r-44b".scale),
            Chord(name: "D", notes: "22r-44b".scale),
            Chord(name: "", notes: "22r-3-10-44b".scale),
            Chord(name: "D", notes: "22r-3-10-44b".scale)
        ]
    }()

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: - ChordTableViewController+UITableViewDataSource

extension ChordTableViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: .zero)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }

}

// MARK: - ChordTableViewController+UITableViewDelegate

extension ChordTableViewController: UITableViewDelegate {

    public func childViewControllerAt(indexPath: IndexPath) -> UIViewController {
        let childViewController = ChordViewController()
        childViewController.chord = data[indexPath.row]
        return childViewController
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(childViewControllerAt(indexPath: indexPath), animated: true)
    }

}
