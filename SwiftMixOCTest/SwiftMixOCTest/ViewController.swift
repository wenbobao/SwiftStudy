//
//  ViewController.swift
//  SwiftMixOCTest
//
//  Created by bob on 16/2/19.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let myTableView : UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
//        self.view.addSubview(myTableView)
//        
//        let myTextField = UITextField(frame: CGRectZero)
//        myTextField.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
//        myTextField.text = "nihao"
//        if(myTextField.editing){
//            print(myTextField)
//        }
//        
//        myTableView.insertSubview(myTextField, aboveSubview: view)
//        myTableView.layoutIfNeeded()
//        
//        self.view.addSubview(myTextField)
        
        self.view.backgroundColor = UIColor.randomColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

