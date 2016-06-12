//
//  DataViewController.swift
//  Alarm App
//
//  Created by Jacob Pashman on 6/11/16.
//  Copyright © 2016 Jacob-Ari. All rights reserved.
//
import UIKit
class DataViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    @IBOutlet var Background: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.Background.layer.cornerRadius = self.Background.frame.size.width / 0.2;
        //self.Background.clipsToBounds = true;
        // Do any additional setup after loading the view, typically from a nib.
        //print(pageDataGlobal[0])
        let swipeDown = UISwipeGestureRecognizer(target:self, action:"down:")
        let swipeUp = UISwipeGestureRecognizer(target:self, action:"up:")
        swipeDown.direction = .Down
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeUp)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        2
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }
}

