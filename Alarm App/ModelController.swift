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
        playBackgroundMusic("sunnyalarm_GUwAcclY.mp3")
        test()

    }
    var backgroundMusicPlayer = AVAudioPlayer()
    func test () {

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
        
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        
        var audioPlayer:AVAudioPlayer?
        
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            NSLog("Player not available")
        }
        
        return audioPlayer
    }
    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(viewController: DataViewController) -> Int {
        
        return pageData.indexOf(viewController.dataObject) ?? NSNotFound
    }
    
    
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

