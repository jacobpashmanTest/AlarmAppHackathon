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
        
        
        
        
        // set up some values to use in the curve
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(135, 150, 135, 135)
        // create the bezier path
        let ovalPath = UIBezierPath()
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
        radius: CGRectGetWidth(ovalRect) / 1, startAngle: ovalStartAngle, endAngle: ovalEndAngle, clockwise: true)
        // create an object that represents how the curve
        // should be presented on the screen
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.redColor().CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        // add the curve to the screen
        self.view.layer.addSublayer(progressLine)
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        // add the animation
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
        
        
        
        
        
        
        
        
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

