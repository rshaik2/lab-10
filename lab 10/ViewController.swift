//
//  ViewController.swift
//
//
//  Created by Riyaz12 on 25/03/17.
//  Copyright © 2017 Riyaz12. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var directionlbl: UILabel!
    @IBOutlet var countLbl: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Round Edges to Labels
        
        directionlbl.layer.masksToBounds = true
        directionlbl.layer.cornerRadius = 10
        
        countLbl.layer.masksToBounds = true
        countLbl.layer.cornerRadius = 10

        
        //Tap Gestures
        let tap = UITapGestureRecognizer(target:self, action:#selector(ViewController.handlleDoubleTaps(sender:)))
        tap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tap)
        
        
        //Swipe Gesture Initialization
        
        self.addSwipe()
    }
    
    //Swipe Gesture Methods

    func addSwipe() {
        let directions: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.NhandleSwipe(sender:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
    }
    
    
    //Tap Gesture Methods
    func handlleDoubleTaps(sender:UITapGestureRecognizer) {
        
        self.countLbl.text = "Double Tap"
        
    }


    func NhandleSwipe(sender: UISwipeGestureRecognizer) {
        
        
        let direction = sender.direction
        
        if direction == UISwipeGestureRecognizerDirection(rawValue: 1) {
            
            self.directionlbl.text = "Right"
            
        }
        else if direction == UISwipeGestureRecognizerDirection(rawValue: 2)
        {
            self.directionlbl.text = "Left"

        }
        else if direction == UISwipeGestureRecognizerDirection(rawValue: 8)
        {
            self.directionlbl.text = "Down"

        }
        else
        {
            self.directionlbl.text = "Up"

        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

