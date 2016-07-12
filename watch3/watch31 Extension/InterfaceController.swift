//
//  InterfaceController.swift
//  watch31 Extension
//
//  Created by 十三郎 on 16/7/7.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("新三板+");
        
        
        // Configure interface objects here.
        stockList.setNumberOfRows(4, withRowType: "tablecell")
        for i in 0...4 {
            // Set the values for the row controller
            _ = stockList.rowControllerAtIndex(i)
            
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    @IBOutlet weak var stockList:WKInterfaceTable!
    @IBOutlet weak var stockName:WKInterfaceLabel!

}
