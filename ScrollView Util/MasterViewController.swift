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
    
    public var sendController: DragDropSender?
    
    public var recieveController: DragDropReciever?

    
    public required init?(coder aDecoder: NSCoder) {
        SlideMenuOptions.leftViewWidth = 150
        SlideMenuOptions.rightViewWidth = 400
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.panGesturesEnabled = false
        
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Workspace") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ObjectDrawer") {
            self.leftViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailPanel") {
            self.rightViewController = controller
        }
        
        super.awakeFromNib()
    }
    
}
