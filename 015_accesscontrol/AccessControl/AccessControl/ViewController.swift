//
//  ViewController.swift
//  AccessControl
//
//  Created by Jan Brinkmann on 12/02/16.
//  Copyright © 2016 Jan Brinkmann. All rights reserved.
//

import UIKit
import ContractorKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fabrik = Autofabrik()
        let porsche = fabrik.newPorsche()
        porsche.name

        print(porsche.getId())
        
        let helper = Preishelper()
        helper.getVK()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

