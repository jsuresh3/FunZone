//
//  NoteMainViewController.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-06.
//

import UIKit

class NoteMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return DBHelper.dbHelper.viewNotes().count
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        var notesList = DBHelper.dbHelper.viewNotes()
        var note = notesList[indexPath.row]
        cell.noteLabel.text = note.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var notesList = DBHelper.dbHelper.viewNotes()
        var note = notesList[indexPath.row]
        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "notesEditor") as! NoteViewController
        print(note.body!)
        storyVC.noteBody = note.body
        storyVC.noteTitle = note.title
        self.present(storyVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reload), userInfo: reload, repeats: true)
        

        // Do any additional setup after loading the view.
    }
    
    @objc func reload () {
        self.loadView()
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
