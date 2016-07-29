//
//  NewsListViewController.swift
//  SwiftNews
//
//  Created by 十三郎 on 16/7/29.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit
import Alamofire

class NewsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var listTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //table
        var cellNib = UINib(nibName: "NewsListTableViewCell", bundle: nil)
        
        self.listTableView.registerNib(cellNib, forCellReuseIdentifier: "NewsListTableViewCell")
        self.listTableView.rowHeight = 60
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        
        
        Alamofire.request(.GET, "http://test.apis.neeqm.cn/news/list",parameters: ["page":"2","limit":"10","shortsubcol":"index"])
            .responseJSON { response in
                print(response.result.value)
                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NewsListTableViewCell", forIndexPath: indexPath) as? NewsListTableViewCell
        return cell!
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
