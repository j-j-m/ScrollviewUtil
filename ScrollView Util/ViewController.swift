//
//  ViewController.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/23/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    var canvas: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //scrollView.contentSize = CGSize(width: 10000, height: 10000)
        scrollView.delegate = self
        
        canvas = UIView(frame: CGRect(x: 0, y: 0, width: 100000, height: 100000))
       // canvas?.backgroundColor = UIColor.init(patternImage: UIImage(named: "scrollBacking" )! )
        canvas?.backgroundColor = UIColor.init(patternImage: drawGridImage(100)! )
        scrollView.addSubview(canvas!)
      
        // I dont like doing this. dunno why.
        scrollViewDidZoom(scrollView)
   
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawGridImage(_ size: CGFloat) -> UIImage? {
        
        // could find a nice, smoother way to do this, may find a way to compose images at different scales.
        
    
        // determine scale
        
        var s = size
        if s <= 20 { s = 20 }
        else if s < 50 { s = 50 }
        else if s < 100 { s = 100 }
     
        
        let calcSize = CGSize(width: s, height: s)
        print(calcSize)

        let bounds = CGRect(origin: CGPoint.zero, size: calcSize)
        let opaque = true
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(calcSize, opaque, scale)
        if let context = UIGraphicsGetCurrentContext() {
        
        // Setup complete
            
            
        // Begin drawing
        context.setFillColor(UIColor.black.cgColor)
        context.setStrokeColor(UIColor.white.withAlphaComponent(0.1).cgColor)
            context.setLineWidth(calcSize.width/20.0)
        
        context.stroke(bounds)
        
        context.beginPath()
        context.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
        context.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        context.move(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        context.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        context.strokePath()
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        }
        
        
       return nil
        
        
    }


}

extension ViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return canvas
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
       let s = 1/scrollView.zoomScale
    canvas?.backgroundColor = UIColor.init(patternImage: drawGridImage(10*floor(s+1))! )
    }
    

}

