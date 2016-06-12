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
    @IBOutlet var red: UIImageView!
    var dataObject: String = ""
    var redtrueQ = false
    @IBOutlet var Background: UIView!
    
   // var redtrueQ : Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red.hidden = true

        
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
            
            if redtrueQ == false{
                red.hidden = false
                redtrueQ = true
            }else{
                red.hidden = true
                redtrueQ = false

            }

            
        }
        
        if (sender.direction == .Up) {
            print ("up")
           
            if redtrueQ == false{
                red.hidden = false
                redtrueQ = true
            }else{
                red.hidden = true
                redtrueQ = false
                
            }
        }
    }

 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
            }
}

