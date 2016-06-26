//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteContentView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
  
    override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        
        if segue.identifier == "Save"{
            // if note exists, update title and content
            if let note = note{
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentView.text ?? ""
                RealmHelper.updateNote(note, newNote: newNote)
            }
            else{
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentView.text ?? ""
                note.modificationTime = NSDate()
                RealmHelper.addNote(note)
            }
            
            listNotesTableViewController.notes = RealmHelper.retrieveNote()
        }
                
    
    } // end of prepareForSegue
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note{
            noteTitleTextField.text = note.title
            noteContentView.text = note.content
        }
        else{
            noteTitleTextField.text = ""
            noteContentView.text = ""
        }
    }
    
    var note: Note?
}
