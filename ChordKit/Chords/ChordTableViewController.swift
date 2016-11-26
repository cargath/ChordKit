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

    lazy var tableView = UITableView(frame: .zero)

    var data: [ChordTableViewSection] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        data = ChordTableViewSection.from(JSONArrayNamed: "Defaults")
    }

    func dataAt(_ indexPath: IndexPath) -> ChordTableViewRow {
        return data[indexPath.section].rows[indexPath.row]
    }

    func titleAt(_ indexPath: IndexPath) -> String? {
        return dataAt(indexPath).title
    }

    func chordAt(_ indexPath: IndexPath) -> Chord? {
        return dataAt(indexPath).chord?.chord
    }

}

// MARK: - ChordTableViewController+UITableViewDataSource

extension ChordTableViewController: UITableViewDataSource {

    // MARK: Sections

    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].title
    }

    // MARK: Rows

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].rows.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: .zero)
        cell.textLabel?.text = titleAt(indexPath)
        return cell
    }

}

// MARK: - ChordTableViewController+UITableViewDelegate

extension ChordTableViewController: UITableViewDelegate {

    public func childViewControllerAt(indexPath: IndexPath) -> UIViewController? {

        guard let chord = chordAt(indexPath) else {
            return nil
        }

        let childViewController = ChordViewController()
        childViewController.chord = chord
        childViewController.navigationItem.title = titleAt(indexPath)

        return childViewController
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        if let childViewController = childViewControllerAt(indexPath: indexPath) {
            navigationController?.pushViewController(childViewController, animated: true)
        }
    }

}
