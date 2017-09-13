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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping CompletionHandler1) {
        if groupKey != nil {
            //send to group ref
        } else {
            self.REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId" : uid])
            sendComplete(true)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ message: [Message]) -> ()) {
        var messageArray = [Message]()  //this is where we will put the contents of datasnapshot retrieved from Firebase
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            //1. cycle through every datasnapshot
            for message in feedMessageSnapshot {
                //2.pull content from a datasnapshot
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                //3. create an message using Message model
                let message = Message(content: content, senderId: senderId)
                //4. Append it to the array
                messageArray.append(message)
            }
            handler(messageArray)
        }
    }
    
}
