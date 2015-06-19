//
//  DetailViewController.swift
//  RezeptEdit
//
//  Created by Jan Brinkmann on 19/06/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var meinRezept: Rezept?
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func speichernTapped(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputField.text = meinRezept?.name
    }
}
