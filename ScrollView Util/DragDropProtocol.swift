//
//  DragDropProtocol.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/26/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation



public protocol DragDropCoordinator {
    var sendController: DragDropSender? { get set }
    var recieveController: DragDropReciever? { get set }
}

public protocol DragDropSender {
    
}
public protocol DragDropReciever {
    
}
