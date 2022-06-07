//
//  DBHelper.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-05.
//

import Foundation
import UIKit
import CoreData

class DBHelper{
    
    static var dbHelper = DBHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addNote(noteTitle: String, noteBody: String){
        
        let notes = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: context!) as! Notes
        
        notes.title = noteTitle
        notes.body = noteBody
        
        do{
            try context?.save()
            print("saved")
        }
        catch{
            print("error")
        }
    }
    func viewNotes() -> [Notes]
        {
            var notes = [Notes]()
            var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
            do {
                notes = try context?.fetch(fetchRequest) as! [Notes]
            }
            catch{
                print("errors")
            }
        return notes
    }
        func updateNotes(titleNote : String , bodyNote : String){
            var notes = Notes()
            var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
            fetchRequest.predicate = NSPredicate(format: "title == %@", titleNote)
            
            do{
                let note  =  try context?.fetch(fetchRequest)
                if (note?.count != 0){
                    notes = note?.first as! Notes
                    notes.body = bodyNote
                    try context?.save()
                    print("data updated")
                }
            }
            catch{
                print("error in update")
            }
            
            
        }
        
        func deleteNotes(titleNote : String){
            var notes = Notes()
            var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
            fetchRequest.predicate = NSPredicate(format: "title == %@", titleNote)
            
            do{
                let note  =  try context?.fetch(fetchRequest)
                context?.delete(note?.first as! Notes)
                try context?.save()
                    print("data updated")
                
            }
            catch{
                print("error in update")
            }
            
            
        }
    

    func addLogin(userN: String, pass: String){
        
        let logins = NSEntityDescription.insertNewObject(forEntityName: "Logins", into: context!) as! Logins
        
        logins.username = userN
        logins.password = pass
        
        do{
            try context?.save()
            print("saved")
        }
        catch{
            print("error")
        }
    }
   
        func checkLoginExists(userN : String) -> Bool{
            var logins = Logins()
            var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Logins")
            fetchRequest.predicate = NSPredicate(format: "username == %@", userN)
            
            do{
                let login  =  try context?.fetch(fetchRequest)
                if (login?.count != 0){
                    
                        return true
                    }
                    
                }
            
            catch{
                print("error in update")
            }
            
            return false
        }
    
    func getPass(userN : String) -> String{
        var logins = Logins()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Logins")
        fetchRequest.predicate = NSPredicate(format: "username == %@", userN)
        
        do{
            let login  =  try context?.fetch(fetchRequest)
            if (login?.count != 0){
                
                logins = login?.first as! Logins
                return logins.password!
                    
                }
            
                
            }
        
        catch{
            print("error in update")
        }
        
        return ""
        
    }

}




