//
//  SignUpViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-06.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    var passBool : Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.text! = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func register(_ sender: Any) {
        if (password.text! != password2.text!)
        {
            errorMessage.text! = "Passwords don't match"
            passBool = false
            
        }
        else{
            passBool = true
        }
        
        if (DBHelper.dbHelper.checkLoginExists(userN: userName.text!) == true && passBool! == true)
        {
            errorMessage.text! = "Username already exists"
        }
        else if (passBool! == true)
        
        {
            DBHelper.dbHelper.addLogin(userN: userName.text!, pass: password.text!)
            print(DBHelper.dbHelper.getPass(userN: userName.text!))
            errorMessage.text = "Registration Successful"
            
            let alertUI = UIAlertController(title: "Registration Successful", message: "You can proceed with login", preferredStyle: .actionSheet)
            let okayAction = UIAlertAction(title: "Okay", style: .default){
                (action) in
                self.dismiss(animated: true, completion: {
                    self.dismiss(animated: true)
                })
                
            }
            alertUI.addAction(okayAction)
            self.present(alertUI, animated: true)
            
        }
        
        
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
