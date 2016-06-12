
//
//  PlusController.swift
//  Alarm App
//
//  Created by arig on 6/11/16.
//  Copyright © 2016 Jacob-Ari. All rights reserved.
//

import UIKit

class PlusController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    var alarmTimeVar: NSDate!
    var alarmTimeText: String!
    @IBOutlet weak var alarmText: UILabel!
    @IBOutlet weak var alarmTime: UIDatePicker!
    @IBAction func alarmTimeChanged(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        var strDate = dateFormatter.stringFromDate(alarmTime.date)
        print(alarmTime.date)
       alarmTimeVar = alarmTime.date
        alarmTimeText = strDate
    }
    @IBOutlet weak var minuteLessPicker: UIPickerView!
    let pickerData = ["1","2","3","4","5", "6","7", "8","9", "10","11","12","13", "14", "15", "16","17","18", "19", "20"]
    override func viewDidLoad() {
        super.viewDidLoad()
        minuteLessPicker.dataSource = self
        minuteLessPicker.delegate = self

    }
    @IBAction func savePressed(sender: AnyObject) {
        pageDataTimeGlobal.append(alarmTimeVar)
        pageAmountGlobal.append(alarmTimeText)
        print("alarmTime \(pageDataTimeGlobal)")
        
    }
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //minuteLessPicker.text = pickerData[row]
    }
    
}