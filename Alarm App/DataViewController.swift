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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red.hidden = true

        
        
        
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(135, 150, 135, 135)
        let ovalPath = UIBezierPath()
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
        radius: CGRectGetWidth(ovalRect) / 1, startAngle: ovalStartAngle, endAngle: ovalEndAngle, clockwise: true)
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.redColor().CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        self.view.layer.addSublayer(progressLine)
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
        
        
        
        
        
        
        
        
        let swipeDown = UISwipeGestureRecognizer(target:self, action:Selector ("handleSwipes:"))
        let swipeUp = UISwipeGestureRecognizer(target:self, action:Selector ("handleSwipes:"))
        swipeDown.direction = .Down
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeUp)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Down) {
         
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

