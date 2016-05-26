//
//  AboutViewController.swift
//  SwiftBridge
//
//  Created by 十三郎 on 16/5/19.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    let appname = "三板";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.magentaColor();

        // Do any additional setup after loading the view.
        let button = UIButton.init(type: UIButtonType.Custom);
        button.frame = CGRectMake(100, 100, 80, 30);
        button.setTitle("go next", forState: UIControlState.Normal);
        button .addTarget(self, action: #selector(AboutViewController.goNext(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(button);
    }
    
    func goNext(sender:AnyObject) {
        let fVC = FirstViewController();
        self.navigationController?.pushViewController(fVC, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLog(log:String) -> Void {
        NSLog("this is %@ log:%@", log, self.appname);
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
