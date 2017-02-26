//
//  MasterViewController.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/26/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import UIKit


class MasterController: SlideMenuController, DragDropCoordinator {
    
    public var sendController: DragDropSender? {
        didSet {
            if let controller = sendController as? UIViewController {
                self.leftViewController = controller
            }
        }
    }
    
    public var recieveController: DragDropReciever? {
        didSet {
            if let controller = recieveController as? UIViewController {
                self.mainViewController = controller
            }
        }
    }

    
    public required init?(coder aDecoder: NSCoder) {
        SlideMenuOptions.leftViewWidth = 150
        SlideMenuOptions.rightViewWidth = 400
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.panGesturesEnabled = false
        
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        
        view.addGestureRecognizer(lpgr)
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Workspace") as? ContainerController {
            recieveController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ObjectDrawer") as? ObjectDrawerController {
            sendController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailPanel") {
            self.rightViewController = controller
        }
        
        super.awakeFromNib()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func handleObjectTransition(_ object: Node) {
        recieveController?.recieve(object)
    }
    
}

extension MasterController {
    
    func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == UIGestureRecognizerState.began {
            
            if let controller = sendController as? ObjectDrawerController {
                let p = gestureReconizer.location(in: controller.view)
                let indexPath = controller.collectionView.indexPathForItem(at: p)
                
                if let index = indexPath {
                    self.slideMenuController()?.closeLeft()
                    self.slideMenuController()?.closeRight()
                    var node = controller.nodeTypeList[index.item]
                    handleObjectTransition(node)
                    // do stuff with your cell, for example print the indexPath
                    print(index.row)
                } else {
                    print("Could not find index path")
                }

            }
            

        }
        else if gestureReconizer.state == .changed {
            print(gestureReconizer.location(in: self.view))
        }
    }
}
