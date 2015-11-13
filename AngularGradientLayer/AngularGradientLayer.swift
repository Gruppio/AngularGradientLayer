//
//  AngularGradientLayer.swift
//  AngularGradientLayer
//
//  Created by Michele Gruppioni on 08/11/15.
//  Copyright © 2015 Michele Gruppioni. All rights reserved.
//

import UIKit

class AngularGradientLayer: CALayer {
    
    // Mark: Propreties
    
    var colorPositions: [ColorPosition] {
        didSet{
            colorPositions.sortInPlace()
            self.setNeedsDisplay()
        }
    }
    
    var startAngle: Double = 90 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    // Mark: Initializers
    
    override init() {
        self.colorPositions = [ColorPosition]()
        self.colorPositions.append(ColorPosition(color: UIColor.whiteColor(), position: 0.0))
        self.colorPositions.append(ColorPosition(color: UIColor.blackColor(), position: 1.0))
        super.init()
        self.delegate = self
        self.setNeedsDisplay()
    }
    
    override init(layer: AnyObject) {
        self.colorPositions = [ColorPosition]()
        self.colorPositions.append(ColorPosition(color: UIColor.whiteColor(), position: 0.0))
        self.colorPositions.append(ColorPosition(color: UIColor.blackColor(), position: 1.0))
        super.init(layer: layer)
        self.delegate = self
        self.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.colorPositions = [ColorPosition]()
        self.colorPositions.append(ColorPosition(color: UIColor.whiteColor(), position: 0.0))
        self.colorPositions.append(ColorPosition(color: UIColor.blackColor(), position: 1.0))
        super.init(coder: aDecoder)
        self.delegate = self
        self.setNeedsDisplay()
    }
    
    // Mark: Draw
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        print("draw")
        
        
        var x: CGFloat  = 0
        var y: CGFloat  = 0
        let width       = layer.bounds.width
        let height      = layer.bounds.height
        let centerPoint = CGPoint(x: width / 2, y: height / 2)
        
        
        CGContextSaveGState(ctx)
        
        
        
        for index in 0...Int(width) {
            x = CGFloat(index)
            let points = [centerPoint, CGPoint(x: x, y: y)]
            CGContextSetStrokeColorWithColor(ctx, UIColor.greenColor().CGColor)
            CGContextStrokeLineSegments(ctx, points, 1)
        }
        
        y = height
        for index in 0...Int(width) {
            x = CGFloat(index)
            let points = [centerPoint, CGPoint(x: x, y: y)]
            CGContextSetStrokeColorWithColor(ctx, UIColor.greenColor().CGColor)
            CGContextStrokeLineSegments(ctx, points, 1)
        }
        
        x = width
        for index in 0...Int(height) {
            y = CGFloat(index)
            let points = [centerPoint, CGPoint(x: x, y: y)]
            CGContextSetStrokeColorWithColor(ctx, UIColor.greenColor().CGColor)
            CGContextStrokeLineSegments(ctx, points, 1)
        }
        
        x = 0
        for index in 0...Int(height) {
            y = CGFloat(index)
            let points = [centerPoint, CGPoint(x: x, y: y)]
            CGContextSetStrokeColorWithColor(ctx, UIColor.greenColor().CGColor)
            CGContextStrokeLineSegments(ctx, points, 1)
        }

        CGContextRestoreGState(ctx)
    }
    
    
    
    private func getRadians(angle: Int) -> CGFloat {
        return CGFloat(Double(angle) * 0.0174533)
    }
}
