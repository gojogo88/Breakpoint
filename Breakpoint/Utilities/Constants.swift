//
//  Constants.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

typealias CompletionHandler = (_ Success: Bool, _ error: Error?) -> ()
typealias CompletionHandler1 = (_ Success: Bool) -> ()

