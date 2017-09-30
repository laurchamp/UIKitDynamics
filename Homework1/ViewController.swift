//
//  ViewController.swift
//  Homework1
//
//  Created by Lauren Champeau on 9/7/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Declare behaviors as variables
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var bouncing : UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set behaviors to do stuff
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)
        collision = UICollisionBehavior()
        animator.addBehavior(collision)
        bouncing = UIDynamicItemBehavior()
        bouncing.elasticity = 0.6
        animator.addBehavior(bouncing)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // I want my balls to be random colors to make it more interesting
    func randColor() -> UIColor{
        let red:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let green:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let blue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func createAndDropPushed(_ sender: Any) {
        // Make the ball when the button gets pressed.
        let ballView = UIView(frame: CGRect(x: 0, y: 25, width: 50, height: 50))
        
        // Make it circular. Like a ball.
        ballView.layer.cornerRadius = 25
        
        // Make it random color
        ballView.backgroundColor = randColor()
        self.view.addSubview(ballView)
        
        // Make collision behavior work between balls
        collision.addItem(ballView)
        gravity.addItem(ballView)
        bouncing.addItem(ballView)
    }
}

