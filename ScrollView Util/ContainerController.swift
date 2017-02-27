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
            parent.slideMenuController()?.openRight()
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
            controller.canvas?.addSubview(nodeView)
            print("object recieved")
        }
        
    }
}



