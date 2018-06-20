//
//  InterfaceController.swift
//  ShortcutsWatchOSBugs WatchKit Extension
//
//  Created by Ji,Jason on 6/20/18.
//  Copyright © 2018 Capital One Labs. All rights reserved.
//

import WatchKit
import Foundation
import Intents

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        let intent = DoSomethingIntent()
        intent.foo = "A foo from watch"
        let shortcut = INRelevantShortcut(shortcut: INShortcut(intent: intent)!)
        INRelevantShortcutStore.default.setRelevantShortcuts([shortcut]) { (error) in
            if let error = error { print(error.localizedDescription); return }
            print("set relevant shortcuts") 
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
