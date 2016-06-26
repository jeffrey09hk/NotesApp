//
//  ListNotesTableViewCell.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 10/18/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit

class ListNotesTableViewCell: UITableViewCell {

    @IBOutlet weak var noteTitleLabel: UILabel!
    
    @IBOutlet weak var noteModificationTimeLabel: UILabel!
    
    func longPress() {
        print("cell long press")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress))
        contentView.addGestureRecognizer(longPress)
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        ListNotesTableViewController(alertController, animated: true, completion: nil)
        return
    }
}
