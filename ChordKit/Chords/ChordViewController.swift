//
//  ChordViewController.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit
import WebKit
import ChordKit

class ChordViewController: UIViewController {

    lazy var webView: WKWebView = {
        return WKWebView(frame: .zero)
    }()

    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // webView.loadHTMLString("Hello, world!", baseURL: nil)
        webView.loadHTMLString(Chord(name: "D", notes: "22r-44b".scale).svg, baseURL: nil)
    }

}
