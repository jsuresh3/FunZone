//
//  NoteViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-05.
//

import UIKit

class NoteViewController: UIViewController {

   
    @IBOutlet weak var bodyNote: UITextView!
    @IBOutlet weak var titleNote: UITextView!
    var noteTitle: String?
    var noteBody: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleNote.text = noteTitle
        bodyNote.text = noteBody
        
        titleNote.layer.borderColor = UIColor.lightGray.cgColor
        titleNote.layer.borderWidth = 133
        titleNote.layer.cornerRadius = 5
        bodyNote.layer.borderWidth = 1
        bodyNote.layer.cornerRadius = 5
        bodyNote.layer.borderColor = UIColor.lightGray.cgColor
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func deleteNote(_ sender: Any) {
        DBHelper.dbHelper.deleteNotes(titleNote: titleNote.text!)
        self.dismiss(animated: true)
    
        
    }
    
    @IBAction func save(_ sender: Any) {
        var notes = DBHelper.dbHelper.viewNotes()
        var updateCheck = false
        for n in notes {
            if (titleNote.text == n.title)
            {
                DBHelper.dbHelper.updateNotes(titleNote: n.title!, bodyNote: bodyNote.text!)
                updateCheck = true
            }
                
        }
        if (updateCheck == false)
        {
            DBHelper.dbHelper.addNote(noteTitle: titleNote.text!, noteBody: bodyNote.text!)
            
        }
        self.dismiss(animated: true)
        
        
        
        
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
