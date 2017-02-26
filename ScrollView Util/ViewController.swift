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
        canvas?.backgroundColor = UIColor.init(patternImage: drawCustomImage(size: CGSize(width:100, height:100))! )
        scrollView.addSubview(canvas!)
      
        // I dont like doing this. dunno why.
        scrollViewDidZoom(scrollView)
   
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawCustomImage(size: CGSize) -> UIImage? {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        let opaque = true
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        if let context = UIGraphicsGetCurrentContext() {
        
        // Setup complete, do drawing here
        context.setFillColor(UIColor.black.cgColor)
        context.setStrokeColor(UIColor.white.withAlphaComponent(0.2).cgColor)
            context.setLineWidth(size.width/20.0)
        
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
        print(s)
       canvas?.backgroundColor = UIColor.init(patternImage: drawCustomImage(size: CGSize(width:10*floor(s+1), height:10*floor(s+1)))! )
    }
    

}

