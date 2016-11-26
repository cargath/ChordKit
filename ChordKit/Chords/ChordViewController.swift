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

    lazy var webView = WKWebView(frame: .zero)

    var chord: Chord? {
        didSet {
            if let chord = chord {
                webView.loadHTMLString(chord.html(width: Int(view.bounds.size.width), strokeWidth: Int(1.5 * UIScreen.main.scale)), baseURL: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(webView)
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(x: 0, y: topLayoutGuide.length, width: view.bounds.size.width, height: view.bounds.size.height - topLayoutGuide.length)
        webView.scrollView.isScrollEnabled = false
        // Now we actually finished layouting our main views subviews
        super.viewDidLayoutSubviews()
    }

}
