//
//  DataService.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//


//swift file
import Foundation
import Firebase

class DataService {
    static let instance = DataService()  //create an instance of this class
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")  //In Firebase, if a value does not exist when you go and try to save something in a certain child, it will create it
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(forUID uid: String, forUserData userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)  //will create a user in Firebase
    }
    
}