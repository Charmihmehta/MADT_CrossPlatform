//
//  ViewController.swift
//  touch_app
//
//  Created by MacStudent on 2018-07-23.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(Double(arc4random_uniform(255))/255)
        let green = CGFloat(Double(arc4random_uniform(255))/255)
        let blue = CGFloat(Double(arc4random_uniform(255))/255)
        return UIColor(red: red, green: green, blue: blue, alpha:1.0)
    }
}
class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func updateLabelsFromTouches(_ touch: UITouch?, allTouches:
        Set<UITouch>?) {
        let numTaps = touch?.tapCount ?? 0
        if(numTaps==1)
        {
            first_ring()
        }
        else if(numTaps==2)
        {
            second_ring()
        }
        else if(numTaps==3)
        {
            third_ring()
        }
        else if(numTaps==4)
        {
            forth_ring()
        }
        else if(numTaps==5)
        {
            fifth_ring()
        }
       
        let numTouches = allTouches?.count ?? 0
        let touchMsg = "\(numTouches) touches detected"
        
      
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event:
        UIEvent?) {
        
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    func first_ring()
    {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.randomColor().cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func second_ring()
    {
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: 160,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = circlePath1.cgPath
        
        //change the fill color
        shapeLayer1.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer1.strokeColor = UIColor.randomColor().cgColor
        //you can change the line width
        shapeLayer1.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer1)
    }
    func third_ring()
    {
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 220,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = circlePath2.cgPath
        
        //change the fill color
        shapeLayer2.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer2.strokeColor = UIColor.randomColor().cgColor
        //you can change the line width
        shapeLayer2.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer2)
    }
    func forth_ring()
    {
        let circlePath3 = UIBezierPath(arcCenter: CGPoint(x: 125,y: 150), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = circlePath3.cgPath
        
        //change the fill color
        shapeLayer3.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer3.strokeColor = UIColor.randomColor().cgColor
        //you can change the line width
        shapeLayer3.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer3)
    }
    func fifth_ring()
    {
        let circlePath4 = UIBezierPath(arcCenter: CGPoint(x: 185,y: 150), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer4 = CAShapeLayer()
        shapeLayer4.path = circlePath4.cgPath
        
        //change the fill color
        shapeLayer4.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer4.strokeColor = UIColor.randomColor().cgColor
        //you can change the line width
        shapeLayer4.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer4)
    }
    

}

