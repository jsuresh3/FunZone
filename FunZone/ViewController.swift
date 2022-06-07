//
//  ViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-05-25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var remSwitch: UISwitch!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    let userDefaults = UserDefaults()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userDefaults.setValue("abc", forKey: "James")
        errorMessage.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        /*
        if (userDefaults.object(forKey: userName.text!) != nil)
        {
            if(userDefaults.value(forKey: userName.text!) as! String == password.text!)
            {
             let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "tabView") as! TabViewController
            self.present(storyVC, animated: true)
            }
            else{
                errorMessage.text! = "Wrong Password or Account does not exist"
            }
            }
        else
        {
            errorMessage.text! = "Wrong Password or Account does not exist"
        }
    }
    */
        if (DBHelper.dbHelper.checkLoginExists(userN: userName.text!) == true )
        {
            if (DBHelper.dbHelper.getPass(userN: userName.text!) == password.text)
            {
                let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "tabView") as! TabViewController
                storyVC.modalPresentationStyle = .fullScreen
                
                
                self.present(storyVC, animated: true)
            }
            else
            {
                errorMessage.text = "Wrong username or password"
            }
        }
        else {
            errorMessage.text = "Wrong username or password"
        }
        
        
        
    }
  
    
    @IBAction func welcomePressed(_ sender: Any) {
        print("hello")
    }
}

