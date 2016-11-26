//
//  ChordTableViewController.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

class ChordTableViewController: UIViewController {

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero)
    }()

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
    }

}
