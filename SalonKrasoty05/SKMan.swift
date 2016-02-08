//
//  SKMan.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 30.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import Foundation

class SKMan{
    var name = ""
    var location = ""
    var image = ""
    var phoneNumber = ""
    
    init(name: String, location: String, phoneNumber: String,image: String) {
        self.name = name
        self.location = location
        self.phoneNumber = phoneNumber
        self.image = image
    }
}