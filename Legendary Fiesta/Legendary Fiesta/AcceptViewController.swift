//
//  AcceptViewController.swift
//  Legendary Fiesta
//
//  Created by ryan teixeira on 8/13/17.
//  Copyright © 2017 Blazecore. All rights reserved.
//

import UIKit

    class AcceptViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func acceptAction(_ sender: Any) {
            UserDefaults.standard.set(true, forKey: "isAccepted")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.switchToMainViewController()
        }

    }
