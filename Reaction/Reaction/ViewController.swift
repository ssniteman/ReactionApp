//
//  ViewController.swift
//  Reaction
//
//  Created by Shane Sniteman on 9/18/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height


class ViewController: UIViewController {

    let timerBar = UIView()
    
    let buttons = [UIButton(),UIButton(),UIButton()]
    
    let scoreLabel = UILabel()
    
    var timer: NSTimer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.blueColor()
    
        //first color
        
        var topColor = UIColor(red: 0.910, green: 0.976, blue: 0.333, alpha: 1.0)
        
        //second color
        
        var bottomColor = UIColor(red: 0.973, green: 0.204, blue: 0.333, alpha: 1.0)
        
        //array of colors in gradient
        
        var gradientColors: [AnyObject] = [topColor.CGColor, bottomColor.CGColor]
        
        //array of locaions for colors in gradient
        
        var gradientLocations = [0.0,1.0]
        
        //gradient layer
        
        var gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.frame
        
        gradientLayer.startPoint = CGPointMake(0.6, -0.1)
        gradientLayer.endPoint = CGPointMake(0.4, 1.1)
        
        //add colors to gradient layer
       
        gradientLayer.colors = gradientColors
        
        //add locations to gradient layer
        
        gradientLayer.locations = gradientLocations
        
        //add gradient to view layer as background
        
        self.view.layer.addSublayer(gradientLayer)
 
        
        for i in 0..<buttons.count {
            
            var button = buttons[i]
            
            var size: CGFloat = 100
            
            var x = (SCREEN_WIDTH / 2.0) - (size / 2.0)
            var y = (SCREEN_HEIGHT / 2.0) - (size / 2.0) + (CGFloat(i - 1) * (size + 20))
            
            button.frame = CGRectMake(x, y, size, size)
            button.layer.cornerRadius = size / 2.0
            button.backgroundColor = UIColor.whiteColor()
            
            // so we know which button we're tapping -- 0, 1, or 2
            button.tag = i
            
            
            button.addTarget(self, action: Selector("buttonTapped:"), forControlEvents: .TouchUpInside)

            self.view.addSubview(button)
            
        }
        
        
        timerBar.backgroundColor = UIColor.whiteColor()
        timerBar.frame = CGRectMake(0,0,0,30)
        self.view.addSubview(timerBar)
        
        self.resetTimerWithSpeed(5)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func resetTimerWithSpeed(speed: Double) {
        
        if timer != nil {
            
            timer!.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: Selector("timerDone"), userInfo: nil, repeats: false)
        
        timerBar.frame.size.width = SCREEN_WIDTH
        
        UIView.animateWithDuration(speed, animations: { () -> Void in
            
        })
        
        UIView.animateWithDuration(speed, delay: 0, options: .CurveLinear, animations: { () -> Void in
            
              self.timerBar.frame.size.width = 0
            
            }) { (succeeded: Bool) -> Void in
            
                
        }
        

    }
    
    func timerDone() {
        
        println("Game Over")
        
    }
    
    func buttonTapped(button: UIButton) {
        
        println(button.tag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

