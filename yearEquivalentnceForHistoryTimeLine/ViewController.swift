//
//  ViewController.swift
//  yearEquivalentnceForHistoryTimeLine
//
//  Created by Normand Martin on 16-05-15.
//  Copyright © 2016 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var arr: NSMutableArray = []
var n: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plist = Plist(name: "TotalTimeLine") {
            arr = plist.getMutablePlistFile()!
        }
        
        for arrs in arr {
            var newHist = arrs[0] as! String
            if  newHist.containsString("ka"){
                newHist.removeAtIndex(newHist.endIndex.predecessor())
                newHist.removeAtIndex(newHist.endIndex.predecessor())
                newHist.removeAtIndex(newHist.endIndex.predecessor())
                let ya = 1000 * Double(newHist)!
                let BC = ya - 2000
                let arrElement = arrs[0] as! String
                let arrNewElement = "Year: \(arrElement)," + " \(Int(ya)) Ya," + " \(Int(BC)) BC"
                arr[n] = [arrNewElement, arrs[1], arrs[2], arrs[3]]

            }
        n = n + 1
        }
        if let plist = Plist(name: "TotalTimeLine"){
            do {
                try plist.addValuesToPlistFile(arr)
            } catch {
                print(error)
            }
            //let newArr = plist.getValuesInPlistFile()!
            //print(newArr)
        }else{
            print("unable to get plist")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

