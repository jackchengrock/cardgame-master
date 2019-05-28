//
//  ViewController.swift
//  cardgame
//
//  Created by calvin.chang on 2018/4/5.
//  Copyright © 2018年 calvin.chang. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rules(_ sender: Any) {
        let controller = UIAlertController(title: "遊戲說明 (GameRule)", message: "加油～", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }

}

