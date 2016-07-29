//
//  MeViewController.swift
//  SwiftNews
//
//  Created by 十三郎 on 16/7/29.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit
import ChameleonFramework

/// 获取屏幕的宽
let kScreenWidth = UIScreen.mainScreen().bounds.size.width
/// 获取屏幕的高
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        
        //UIColor.flatPinkColor().flatten()
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), andColors: [FlatNavyBlue(), FlatGreenDark()])
        



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
