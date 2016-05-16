//
//  ViewController.swift
//  SwiftDemo2
//
//  Created by bob on 16/3/8.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var shoppingList = ["apple","pig"]
//        
//        shoppingList.isEmpty
//        shoppingList.count
//        shoppingList.append("orange")
//        
//        shoppingList += ["good"]
//        
//        shoppingList.insert("aa", atIndex: 0)
//        shoppingList.last
//        shoppingList.first
//        shoppingList.removeFirst()
//        
//        for item in shoppingList{
//            print(item)
//        }
//        
//        for (index, item) in shoppingList.enumerate(){
//            
//        }
//
//
        
        ///-----------------///
        print(sayHello("Michacl"))
//        playMusic()
        
        print(MaxNumber(1, num2: 2))
        
        var fruits = ["apple","orange"]
        
        
    }
    
    
    func backwards(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    
    func playMusic() {
        
    }
    
    func sayHello(name: String) ->String {
        
        return "hello : "+name
    }
    
    func MaxNumber(num1: Int,num2:Int) ->Int {
        
        return num1>num2 ? num1 : num2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

