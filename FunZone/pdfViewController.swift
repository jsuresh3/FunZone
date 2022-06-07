//
//  pdfViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-02.
//

import UIKit
import PDFKit

class pdfViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    var bookNum: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

            let pdfView = PDFView(frame: customView.bounds)
            pdfView.autoScales = true
            customView.addSubview(pdfView)
            var filePath : URL?
        
        switch bookNum!
        {
        case 0:
             filePath = Bundle.main.url(forResource: "Relativity---The-Special-and-General-Theory", withExtension: "pdf")
        case 1:
             filePath = Bundle.main.url(forResource: "The-Grammar-of-English-Grammars", withExtension: "pdf")
        case 2:
             filePath = Bundle.main.url(forResource: "jekyl", withExtension: "pdf")
        case 3:
             filePath = Bundle.main.url(forResource: "20000", withExtension: "pdf")
        default:
            print("error")
        }
            pdfView.document = PDFDocument(url: filePath!)
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
