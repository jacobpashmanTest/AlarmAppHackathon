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
    //@IBOutlet var Red: UIImageView!
    var dataObject: String = ""
    @IBOutlet var Background: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.Background.layer.cornerRadius = self.Background.frame.size.width / 0.2;
        //self.Background.clipsToBounds = true;
        // Do any additional setup after loading the view, typically from a nib.
        //print(pageDataGlobal[0])
        let swipeDown = UISwipeGestureRecognizer(target:self, action:Selector ("handleSwipes:"))
        let swipeUp = UISwipeGestureRecognizer(target:self, action:Selector ("handleSwipes:"))
        swipeDown.direction = .Down
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeUp)
        //Red.hidden=true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
            }
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Down) {
            // Red.hidden=false
            //UIView.animateWithDuration(0.6 , animations: { self.view.transform = CGAffineTransformMakeScale(0.6, 0.6) }, completion: { finish in UIView.animateWithDuration(0.6){ self.view.transform = CGAffineTransformIdentity } })
            print("down")
            
        }
        
        if (sender.direction == .Up) {
            print ("up")
            
        }
    }

 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
            }
}

