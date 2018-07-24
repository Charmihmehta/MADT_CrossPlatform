//
//  ViewController.swift
//  olympic_ring
//
//  Created by MacStudent on 2018-07-23.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.blue.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
        
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: 160,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = circlePath1.cgPath
        
        //change the fill color
        shapeLayer1.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer1.strokeColor = UIColor.black.cgColor
        //you can change the line width
        shapeLayer1.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer1)
        
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 220,y: 100), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = circlePath2.cgPath
        
        //change the fill color
        shapeLayer2.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer2.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer2.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer2)
        
        let circlePath3 = UIBezierPath(arcCenter: CGPoint(x: 125,y: 150), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = circlePath3.cgPath
        
        //change the fill color
        shapeLayer3.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer3.strokeColor = UIColor.yellow.cgColor
        //you can change the line width
        shapeLayer3.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer3)
        
        let circlePath4 = UIBezierPath(arcCenter: CGPoint(x: 185,y: 150), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer4 = CAShapeLayer()
        shapeLayer4.path = circlePath4.cgPath
        
        //change the fill color
        shapeLayer4.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer4.strokeColor = UIColor.green.cgColor
        //you can change the line width
        shapeLayer4.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}

