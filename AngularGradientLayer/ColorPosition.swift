//
//  ColorPoint.swift
//  AngularGradientLayer
//
//  Created by Michele Gruppioni on 12/11/15.
//  Copyright © 2015 Michele Gruppioni. All rights reserved.
//

import UIKit

struct ColorPosition: Comparable {
    var color:      UIColor
    var position:   CGFloat  {
        didSet {
            position = saturate(position, min: 0.0, max: 1.0)
        }
    }
    
    init(color: UIColor, position: CGFloat) {
        self.color      = color
        self.position   = saturate(position, min: 0.0, max: 1.0)
    }
}

func ==(left: ColorPosition, right: ColorPosition) -> Bool {
    return left.position == right.position
}

func <(left: ColorPosition, right: ColorPosition) -> Bool {
    return left.position < right.position
}

func saturate<T: Comparable>(value: T, min minValue: T, max maxValue: T) -> T{
    return min(maxValue, max(minValue, value))
}
