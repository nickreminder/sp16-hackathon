//
//  Node.swift
//  LeftSlideoutMenu
//
//  Created by Molly Driscoll on 4/15/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit


public class Node{
    
    public init(){
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
    let context = UIGraphicsGetCurrentContext()
    let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
    
    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
    CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
    CGContextSetLineWidth(context, 10)
    
    CGContextAddEllipseInRect(context, rectangle)
    CGContextDrawPath(context, .FillStroke)
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    }
    

}