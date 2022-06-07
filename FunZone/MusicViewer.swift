//
//  MusicViewer.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-03.
//

import UIKit
import AVFoundation

class MusicViewer: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var musicLabel: UILabel!
   // @IBOutlet weak var playButton: UIImageView!
    var timer : Timer?
    var Audio: AVAudioPlayer?
    @IBOutlet weak var imageView: UIImageView!
    var musicList = ["Away","Drive","City Lights", "Someday", "Sunrise", "Trees", "Try City"]
    var musicNum : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        musicLabel.text! = musicList[musicNum!]
        var filePath = Bundle.main.path(forResource: musicList[musicNum!], ofType: "mp3")
        var musicURL = URL(fileURLWithPath: filePath!)
        do{
            try Audio = AVAudioPlayer(contentsOf: musicURL)
        }
            
        catch{
            print("error")
        }
       
        if (musicNum! == 2)
        {
            imageView.image = UIImage(imageLiteralResourceName: "City Lights")
        }
        else
        {
            imageView.image = UIImage(imageLiteralResourceName: "Drive")
        }
       
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
       
    }

    @objc func updateTime(){
        var progressTime = Audio!.currentTime/Audio!.duration
        
        progressBar.progress = Float(progressTime)
       
        if((self.view.isHidden) == true){
            Audio?.stop()
            self.dismiss(animated: false, completion: nil)
        
          }
    }
    @IBAction func playPressed(_ sender: Any) {
        Audio?.play()
        
    }
    @IBAction func pausePressed(_ sender: Any) {
        Audio?.stop()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Audio?.stop()
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
