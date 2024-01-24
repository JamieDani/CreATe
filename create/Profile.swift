//
//  Profile.swift
//  create
//
//  Created by Jamie Calub on 1/11/24.
//

import SwiftUI

//includes properties of all profiles
class AllProfiles {
    
    static var fullBrushset = ["pen", "marker", "eraser"]
    static var fullBrushsetIcons = ["pencil.line", "highlighter", "eraser"]
    static var fullColorset = [Color(.red), Color(.green), Color(.blue), Color(.magenta), 
                               Color(.yellow), Color(.black), Color(.brown), Color(.orange)]
    static var fullColorsetString = ["red", "green", "blue", "magenta", "yellow", "black", "brown", "orange"]

    var myProfiles: [MyProfile] = [MyProfile(name: "paul"), MyProfile(name: "ringo"), MyProfile(name: "george"), MyProfile(name: "john")]
    
}

//includes specific settings for each profile
class MyProfile {
    
    var name: String = "None"
    var currBrushset: [Bool] = [true, true, true]
    var currColorset: [Bool] = [true, true, true, true, true, true, true, true]
    
    public init(name: String){
        self.name = name
    }
    
    func updateColor(index: Int) {
        currColorset[index] = currColorset[index] ? false : true
    }
    
    func updateBrush(index: Int) {
        currBrushset[index] = currBrushset[index] ? false : true
    }
}

//next goal, make the settings only apply to each specific profile
