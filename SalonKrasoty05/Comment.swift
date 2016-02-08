//
//  Comment.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 31.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import Foundation

class Comment{
    var nameUser = ""
    var dateComment = ""
    var imageUser = ""
    var description = ""
    
    init(nameUser: String, dateComment: String, imageUser: String, description: String) {
        self.nameUser = nameUser
        self.dateComment = dateComment
        self.imageUser = imageUser
        self.description = description
    }
}