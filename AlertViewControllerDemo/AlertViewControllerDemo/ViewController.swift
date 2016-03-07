//
//  ViewController.swift
//  AlertViewControllerDemo
//
//  Created by bob on 16/3/7.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlertAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "你好", message: "this is a alert", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call", style: .Default, handler: callActionHandler)
        
        let goodAction = UIAlertAction(title: "good", style: .Default) { action in
            print("hello")
        }
        
        alertController.addAction(defaultAction)
        
        alertController.addAction(callAction)
        
        alertController.addAction(goodAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
}

