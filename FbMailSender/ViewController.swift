//
//  ViewController.swift
//  FbMailSender
//
//  Created by hatice kübra kılınç on 13.02.2018.
//  Copyright © 2018 hatice kübra kılınç. All rights reserved.
//

import UIKit
//import SwiftHash

import Firebase
import GoogleSignIn

class ViewController: UIViewController , GIDSignInUIDelegate {
    
 //self.performSegue(withIdentifier: "VC", sender: nil)

    @IBOutlet weak var GIDSignInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
            
        
        //GIDSignIn.sharedInstance().signInSilently()
        
    }


    @IBAction func buton2(_ sender: Any) {
         self.performSegue(withIdentifier: "VC2", sender: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

