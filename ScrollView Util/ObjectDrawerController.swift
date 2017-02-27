//
//  ObjectDrawerController.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/25/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import UIKit

public class ObjectDrawerController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    

    
    
    //id isnt unique at this point
    public var nodeTypeList: [GraphElement] = FlatUIColors.ColorCodes.list.map { GraphElement(id: $0, name: $0, color: FlatUIColors.solidColorFromHexCode($0)) }
        

    
    @IBAction func closeObjectDrawer(sender: UIBarButtonItem) {
        self.slideMenuController()?.closeLeft()
        self.slideMenuController()?.closeRight()
    }
    
    override public func viewDidLoad() {
        
        
        
    //    ColorCodes.allProperties()
        collectionView.register(ObjectCell.self, forCellWithReuseIdentifier: "Cell")
    }

}

public class ObjectCell: UICollectionViewCell {
    
    var viewModel: Node? {
        didSet {
            self.backgroundColor = viewModel?.color
        }
    }
    
}


extension ObjectDrawerController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nodeTypeList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ObjectCell

        cell.viewModel = nodeTypeList[indexPath.item]
        
        return cell
    }
}



//extension ObjectDrawerController: UICollectionViewDelegate {
//    
//}


extension ObjectDrawerController: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.75
        return CGSize(width: width, height: width)
    }
}


extension ObjectDrawerController: DragDropSender {
    public func send(_ object: Node) {
        print("sending object")
    }
}


