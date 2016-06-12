//
//  ModelController.swift
//  Alarm App
//
//  Created by Jacob Pashman on 6/11/16.
//  Copyright © 2016 Jacob-Ari. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */
let defaults = NSUserDefaults.standardUserDefaults()
var newTime: String!
var pageAmountGlobal: [String] = ["12:00 AM"]
var pageDataTimeGlobal: [NSDate] = []
var pageDayGlobal: [String]!
var snoozeTime: [Int]!

class ModelController: NSObject, UIPageViewControllerDataSource {
    
    
    var pageData = pageAmountGlobal
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let isAppAlreadyLaunchedOnce = defaults.stringForKey("isAppAlreadyLaunchedOnce"){
            print("App already launched")
            pageAmountGlobal = defaults.stringArrayForKey("pageAmountGlobal")!
            pageDataTimeGlobal = defaults.objectForKey("pageDataTimeGlobal") as! [NSDate]!
            pageData = pageAmountGlobal
            return true
        }else{
            defaults.setBool(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
    func reloadPageData() {
        let date: NSDate = NSDate()
        let cal: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        let newDate: NSDate = cal.dateBySettingHour(14, minute: 25, second: 0, ofDate: date, options: NSCalendarOptions())!
        pageData = pageAmountGlobal
        let currentTime = defaults.objectForKey("currentTime") as! NSDate!
        print(newDate)
        if NSDate() ==  newDate {
            self.playBackgroundMusic("sunnyalarm_GUwAcclY.mp3")
        }
        
    }
    
    
    
    override init() {
        super.init()
        // Create the data model.
        //        let dateFormatter = NSDateFormatter()
        //        pageData = dateFormatter.monthSymbols

        
       var silence_audio = setupAudioPlayerWithFile("sunnyalarm_GUwAcclY2", type:"wav");
        silence_audio?.numberOfLoops = -1;
        silence_audio?.volume = 1;
        silence_audio?.play();
        let volumeView = MPVolumeView()
        if let view = volumeView.subviews.first as? UISlider{
            view.value = 0.5
        }
        let currentTime: NSDate = NSDate()
        defaults.setObject(currentTime, forKey: "currentTime")
        print(NSDate())
                _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ModelController.reloadPageData), userInfo: nil, repeats: true)
        //playBackgroundMusic("sunnyalarm_GUwAcclY.mp3")
        test()

    }
    var backgroundMusicPlayer = AVAudioPlayer()
    func test () {
//        while 1 == 1 {
//            let date: NSDate = NSDate()
//            let cal: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
//            let newDate: NSDate = cal.dateBySettingHour(14, minute: 51, second: 0, ofDate: date, options: NSCalendarOptions())!
//            pageData = pageAmountGlobal
//            let currentTime = defaults.objectForKey("currentTime") as! NSDate!
//            //print(newDate)
//            if NSDate() ==  newDate {
//                      playBackgroundMusic("sunnyalarm_GUwAcclY.mp3")
//                print("it ran)")
//            }
  
       // }
        

    }
    func playBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            NSLog("Player not available")
        }
        
        return audioPlayer
    }
    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.indexOf(viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func addNewTimer() {
        newTime = "6:45"
        pageData.append(newTime)
        
    }
    
}

