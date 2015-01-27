//
//  View.swift
//  EdoSketch
//
//  Created by edwin vazquez on 1/27/15.
//  Copyright (c) 2015 A Perfect Empire. All rights reserved.
//

import UIKit

class View: UIView {
	var path: CGMutablePathRef = CGPathCreateMutable();	//born empty;

	func clearPath() {
		path = CGPathCreateMutable();	//empty out the path
		setNeedsDisplay();
	}

	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		let touch: UITouch = touches.anyObject() as UITouch;
		let p: CGPoint = touch.locationInView(self);
		CGPathMoveToPoint(path, nil, p.x, p.y);
	}

	override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
		let touch: UITouch = touches.anyObject() as UITouch;
		let p: CGPoint = touch.locationInView(self);
		CGPathAddLineToPoint(path, nil, p.x, p.y);
		setNeedsDisplay();	//trigger a call to drawRect(_:)
	}

	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.

	override func drawRect(rect: CGRect) {
		// Drawing code
		let c: CGContextRef = UIGraphicsGetCurrentContext();
		CGContextBeginPath(c);
		CGContextAddPath(c, path);
		CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);	//black, opaque
		CGContextStrokePath(c);
	}

}
