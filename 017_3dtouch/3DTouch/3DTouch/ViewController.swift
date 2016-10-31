//
//  ViewController.swift
//  3DTouch
//
//  Created by Jan Brinkmann on 31/10/2016.
//  Copyright © 2016 Jan Brinkmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func listButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showList", sender: nil)
    }
    
    func performListshortcut() {
        performSegue(withIdentifier: "showList", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let icon = UIApplicationShortcutIcon(type: .play)
        let item = UIApplicationShortcutItem(type: "de.codingtutor.play", localizedTitle: "Abspielen", localizedSubtitle: nil, icon: icon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [item, item, item, item]
    }
}

