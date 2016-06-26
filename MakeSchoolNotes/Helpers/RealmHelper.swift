//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Jeff Hui on 24/6/2016.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper{
    
    static func doSomething(){
    
    }
    
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(note)
        }
    } // end of addNote
    
    static func deleteNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    } // end of deleteNote
    
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write(){
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }//end of updateNote
    
    static func retrieveNote() -> Results<Note>{
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }

}// end of class