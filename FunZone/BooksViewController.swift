//
//  BooksViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-02.
//

import UIKit
import PDFKit

class BooksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BooksCollectionViewCell
        switch indexPath.row{
        case 0:
        cell.image.image = UIImage(imageLiteralResourceName: "cover-relativity")
        case 1:
        cell.image.image = UIImage(imageLiteralResourceName: "cover-grammar")
        case 2:
        cell.image.image = UIImage(imageLiteralResourceName: "cover-jekyll")
        case 3:
        cell.image.image = UIImage(imageLiteralResourceName: "cover-20k")
        default:
            print("error")
        }
        cell.isOpaque = false
        cell.backgroundColor = UIColor.clear
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
            
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "pdfViewer") as! pdfViewController
        secondVC.bookNum = indexPath.row
             self.present(secondVC, animated: true)
            
            //            let pdfView = PDFView(frame: cell.view.bounds)8
//            view.addSubview(pdfView)
//            let filePath = Bundle.main.url(forResource: "Relativity---The-Special-and-General-Theory", withExtension: "pdf")
//            pdfView.document = PDFDocument(url: filePath!)
            
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
