//
//  FirstViewController.swift
//  SwiftNews
//
//  Created by 十三郎 on 16/7/25.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.orangeColor()
        
        
        Alamofire.request(.GET, "https://httpbin.org/get")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

