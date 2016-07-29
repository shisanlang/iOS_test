//
//  NewsListViewController.swift
//  SwiftNews
//
//  Created by 十三郎 on 16/7/29.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit
import Alamofire

class NewsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Alamofire.request(.GET, "http://test.apis.neeqm.cn/news/list",parameters: ["page":"2","limit":"10","shortsubcol":"index"])
            .responseJSON { response in
                print(response.result.value)
                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
