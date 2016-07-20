//
//  InterfaceController.swift
//  watch31 Extension
//
//  Created by 十三郎 on 16/7/7.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {

    var mystock:NSArray = [
        ["code":"833325.oc","name":"德迈斯"],
        ["code":"832979.oc","name":"弘天生物"],
        ["code":"830899.oc","name":"联讯证券"],
        ["code":"831056.oc","name":"千叶药包"],
        ["code":"832424.oc","name":"科海股份"]
        
    ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("新三板+");
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if (userDefaults.objectForKey("mystock") != nil) {
            mystock = userDefaults.objectForKey("mystock") as! NSArray
        }
        
//        NSLog("stocks=%@", mystock)
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
            if session.reachable {
                session.sendMessage(["action":"stocklist"], replyHandler: {(reponse: [String : AnyObject]) ->Void in
                    
                    NSLog("mystock=%@", reponse["mystock"] as! NSString)
                    
                    }, errorHandler: {(error)->Void in  print(error);})
            }
            
            
            
        }
        
        // Configure interface objects here.
        stockList.setNumberOfRows(mystock.count, withRowType: "tablecell")
        
        for i in 0...mystock.count-1 {
            // Set the values for the row controller
            let stock:NSDictionary = mystock.objectAtIndex(i) as! NSDictionary
            var theRow:MainRowType = stockList.rowControllerAtIndex(i) as! MainRowType
            
            var stockSymbol:String = "--"
            var stockName:String = "--"
            var stockPrice:String = "--"
            var stockZdf:String = "--"
            var stockColor:UIColor = UIColor.whiteColor()
            
            
            if stock.objectForKey("code") != nil {
                let stockCode:NSString = stock.objectForKey("code") as! NSString
                stockSymbol = stockCode.substringToIndex(6)
            }
            if stock.objectForKey("name") != nil {
                stockName = stock.objectForKey("name") as! NSString as String
            }
            if stock.objectForKey("price") != nil {
                stockPrice = stock.objectForKey("price") as! NSString as String
            }
            if stock.objectForKey("zdf") != nil {
                stockZdf = stock.objectForKey("zdf") as! NSString as String
            }
            if stock.objectForKey("zdf") != nil {
                let zdf:CGFloat = stock.objectForKey("zdf") as! CGFloat
                if zdf>0 {
                    stockColor = UIColor.redColor()
                } else if zdf<0 {
                    stockColor = UIColor.greenColor()
                }
            }
            
            
            theRow.stockCode.setText(stockSymbol)
            theRow.stockName.setText(stockName)
            theRow.stockPrice.setText(stockPrice)
            theRow.stockZdf.setText(stockZdf)
            theRow.stockPrice.setTextColor(stockColor)
            theRow.stockZdf.setTextColor(stockColor)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
//    func  session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
//        NSLog("user=%@", userInfo)
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        
//        mystock = userInfo["stock_list"] as! NSArray
//        //        userDefaults.setObject(mystock, forKey: "mystock")
//        //        userDefaults.synchronize()
//    }
    
    @IBOutlet weak var stockList:WKInterfaceTable!
}


class MainRowType: NSObject {
    @IBOutlet weak var stockCode: WKInterfaceLabel!
    @IBOutlet weak var stockName: WKInterfaceLabel!
    @IBOutlet weak var stockPrice: WKInterfaceLabel!
    @IBOutlet weak var stockZdf: WKInterfaceLabel!
}
