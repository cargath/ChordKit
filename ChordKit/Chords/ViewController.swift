//
//  ViewController.swift
//  Chords
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit
import ChordKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = ChordKit.hello
        self.view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
