//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Jeff Hui on 24/6/2016.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object{
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}