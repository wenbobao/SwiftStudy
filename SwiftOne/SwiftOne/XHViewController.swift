//
//  ViewController.swift
//  SwiftOne
//
//  Created by bob on 16/1/28.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit

class XHViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView .registerNib(UINib.init(nibName: "contactCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! contactCell
        return cell
    }
    
}

