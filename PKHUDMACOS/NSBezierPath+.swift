//
//  NSBezierPath+.swift
//  PKHUD
//
//  Created by Fabian Renner on 22.06.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import Foundation

extension NSBezierPath {
    
    var cgPath: CGPath {
        
        get {
            return self.transformToCGPathWithoutClosing()
        }
    }
    
    /// Transforms the NSBezierPath into a CGPathRef without closing it automatically (hit detection is not needed here
    ///
    /// :returns: The transformed NSBezierPath
    private func transformToCGPathWithoutClosing() -> CGPath {
        
        // Create path
        let path = CGMutablePath()
        let points = UnsafeMutablePointer<NSPoint>.allocate(capacity: 3)
        let numElements = self.elementCount
        
        if numElements > 0 {
            
            for index in 0..<numElements {
                
                let pathType = self.element(at: index, associatedPoints: points)
                
                switch pathType {
                case .moveToBezierPathElement:
                    path.move(to: CGPoint(x: points[0].x,y: points[0].y))
                case .lineToBezierPathElement:
                    path.addLine(to: CGPoint(x: points[0].x,y: points[0].y))
                case .curveToBezierPathElement:
                    path.addCurve(to: CGPoint(x: points[0].x,y: points[0].y), control1: CGPoint(x: points[1].x,y: points[1].y), control2: CGPoint(x: points[2].x,y: points[2].y))
                case .closePathBezierPathElement:
                    path.closeSubpath()
                }
            }
            
        }
        
        points.deallocate(capacity: 3)
        return path
    }
    
    func addLine(to point: NSPoint) {
        self.line(to: point)
    }
}
