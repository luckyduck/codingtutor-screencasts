//
//  ViewController.swift
//  Fakultaet
//
//  Created by Jan Brinkmann on 29/05/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var aufgabeLabel: UILabel!
    @IBOutlet weak var ergebnisLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!

    @IBAction func fakultaetBerechnen(sender: AnyObject) {
        
        let myN = inputField.text.toInt();
        if myN != nil && myN <= 8 {
            aufgabeLabel.text = "\(myN!)! = "
            ergebnisLabel.text = "\(calculateFaculty(myN!))"
            aufgabeLabel.hidden = false
            ergebnisLabel.hidden = false
        } else {
            let myAlert = UIAlertController(title:"Oops",
                                            message: "Keine natürliche Zahl, oder > 8",
                                            preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                
            }
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
        }
    }
    
    func calculateFaculty(let n:Int) -> Int {
        // n = 3
        // 3! = 1x2x3 = 6
        
        var faculty = 1;
        var i = 1;
        while (i <= n) {
            faculty *= i++;
        }
        
        return faculty;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

