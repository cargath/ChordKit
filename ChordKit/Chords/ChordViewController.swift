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

    var chord: Chord? {
        didSet {
            if let chord = chord {
                webView.loadHTMLString(chord.html, baseURL: nil)
            }
        }
    }

    override func loadView() {
        view = webView
    }

}
