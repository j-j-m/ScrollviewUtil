//
//  ContainerController.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/24/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import UIKit



class ContainerController: SlideMenuController {
   

    weak var embeddedController : UIViewController?
    
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "embedContentSegue" {
            embeddedController = segue.destination
            
        }
    }
    
    @IBAction func openObjectDrawer(sender: UIBarButtonItem) {
        
        if let parent = self.parent as? SlideMenuController {
            parent.slideMenuController()?.openLeft()
            
            //not sure if I want the below to display at current. ill use it to make an editing panel.
            
//            parent.slideMenuController()?.openRight()
        }
        
    }
    
}

extension ContainerController: DragDropReciever {
    func recieve(_ object: Node, position: CGPoint?) {
        if let controller = embeddedController as? ViewController {
            let nodeView = object.graphRepresentation()
            if let p = position {
                
                nodeView.center = p
            }
            
            //pretty nifty use of CGRect utility
            
            let preFrame = nodeView.frame
            let size = nodeView.frame.size
            nodeView.frame = nodeView.frame.insetBy(dx: CGFloat(size.width/2), dy: CGFloat(size.height/2))
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {() -> Void in
                nodeView.frame = preFrame
            }, completion: {(_ finished: Bool) -> Void in
            })

            
            controller.canvas?.addSubview(nodeView)
            print("object recieved")
        }
        
    }
}



