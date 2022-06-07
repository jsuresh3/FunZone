//
//  MusicViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-03.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var musicList = ["Away","Drive","City Lights", "Someday", "Sunrise", "Trees", "Try City"]
        var cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        cell.backgroundView?.isOpaque = false
        cell.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
        cell.musicLabel.text! = musicList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "musicViewer") as! MusicViewer
        
        storyVC.musicNum = indexPath.row
        
        self.present(storyVC, animated: true)
        
        
        
        
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
