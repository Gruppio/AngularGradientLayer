//
//  ColorPositionTests.swift
//  AngularGradientLayer
//
//  Created by Michele Gruppioni on 12/11/15.
//  Copyright © 2015 Michele Gruppioni. All rights reserved.
//

import XCTest

class ColorPositionTests: XCTestCase {

    func testMaxSaturation() {
        let colorPosition = ColorPosition(color: UIColor.blackColor(), position: 1.1)
        XCTAssertEqual(colorPosition.position, 1.0)
    }
    
    func testMinSaturation() {
        let colorPosition = ColorPosition(color: UIColor.blackColor(), position: -0.1)
        XCTAssertEqual(colorPosition.position, 0.0)
    }

}
