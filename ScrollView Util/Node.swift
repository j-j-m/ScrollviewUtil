//
//  Node.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/25/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import UIKit

public protocol Node {
    var id: String { get set }
    var name: String { get set }
    var color: UIColor { get set }
    var inlets: [AnyObject]? { get set }
    var outlets: [AnyObject]? { get set }
    
    func graphRepresentation() -> UIView
}


public extension Node {
    
    public var name : String {
        get { return "Unnamed" }
    }
    
    public var color : UIColor {
        get { return UIColor.gray }
    }

    func graphRepresentation() -> UIView {
        let view = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        view.backgroundColor = color
        return view
    }
   

}



public class GraphElement: Node {
    
    public var color: UIColor
    public var name: String
    public var id: String
    public var inlets: [AnyObject]?
    public var outlets: [AnyObject]?
 
    init(id:String, name:String, color:UIColor) {
        self.id = id
        self.name = name
        self.color = color
    }
}
