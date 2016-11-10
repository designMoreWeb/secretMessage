//
//  ViewController.swift
//  secretMessage
//
//  Created by Divy Tolia on 11/10/16.
//  Copyright © 2016 DesignMoreWeb. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController {
    @IBOutlet weak var secretMessage: UILabel!
    func unlockSecretMessage() {
        secretMessage.isHidden = false
        title = "Secret stuff!"
        
        if let text = KeychainWrapper.standardKeychainAccess().string(forKey: "SecretMessage") {
            secretMessage.text = text
        }
    }
    func saveSecretMessage() {
        if !secretMessage.isHidden {
            _ = KeychainWrapper.standardKeychainAccess().setString(secretMessage.text!, forKey: "SecretMessage")
            secretMessage.resignFirstResponder()
            secretMessage.isHidden = true
            title = "Hello :)"
        }
    }
    @IBAction func displayMessage(_ sender: Any) {
        return unlockSecretMessage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       saveSecretMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

