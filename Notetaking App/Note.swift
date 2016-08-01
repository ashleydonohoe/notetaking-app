//
//  Note.swift
//  Notetaking App
//
//  Created by Gabriele on 8/1/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit
import Foundation

struct Note {
    var title: String
    var content: String
    var image: UIImage?
    
    init( title: String, content: String, image: UIImage) {
        self.title = title
        self.content = content
        self.image = image
    }
}


struct NoteWithoutImage {
    var title: String
    var content: String
    
    init( title: String, content: String) {
        self.title = title
        self.content = content
    }
}
