//
//  ViewController.swift
//  ShortcutsWatchOSBugs
//
//  Created by Ji,Jason on 6/20/18.
//  Copyright © 2018 Capital One Labs. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let intent = DoSomethingIntent()
        intent.foo = "A foo"
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { (error) in
            if let error = error { print(error.localizedDescription); return }
            print("Donated")
        }
    }


}

