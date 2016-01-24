//
//  ViewController.swift
//  DataFetch
//
//  Created by Jan Brinkmann on 15/01/16.
//  Copyright © 2016 Jan Brinkmann. All rights reserved.
//

// Alamofire
// AFNetworking = AlamofireNetworking

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "http://codingtutor.de/api/rezept.json")
            .responseJSON { response in
        
                if let JSON = response.result.value {
                    let name = JSON["name"] as! String
                    let zutaten = JSON["zutaten"] as! NSArray
                    
                    print(name)
                    for zutat in zutaten {
                        print(zutat)
                    }
                }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

