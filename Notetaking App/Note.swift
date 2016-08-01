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
    var starred: Bool
    
    init( title: String, content: String, image: UIImage? = nil, starred: Bool) {
        self.title = title
        self.content = content
        self.image = image
        self.starred = false
    }
}
