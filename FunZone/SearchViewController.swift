//
//  SearchViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-03.
//

import UIKit
import WebKit
class SearchViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var webKitView = WKWebView()
        let url1 = URL(string: "https://www.google.com")!
        webKitView.load(URLRequest(url: url1))
        
        view = webKitView

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
