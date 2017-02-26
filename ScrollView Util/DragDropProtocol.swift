//
//  DragDropProtocol.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/26/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import UIKit


public protocol DragDropCoordinator {
    var sendController: DragDropSender? { get set }
    var recieveController: DragDropReciever? { get set }
    
    func handleObjectTransition(_ object: Node)
    
}

public protocol DragDropSender {
//    var coordinator: DragDropCoordinator { get }
    
    func send(_ object: Node)
}

public protocol DragDropReciever {
//    var coordinator: DragDropCoordinator { get }
    
    func recieve(_ object: Node)
}
