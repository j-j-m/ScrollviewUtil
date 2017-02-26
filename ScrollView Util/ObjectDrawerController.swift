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
    
    public var nodeTypeList: [GraphElement] = [ GraphElement(id: "a", name: "first", color: .red),
                         GraphElement(id: "b", name: "second", color: .green),
                         GraphElement(id: "c", name: "third", color: .blue),
                         GraphElement(id: "d", name: "fourth", color: .cyan),
                         GraphElement(id: "e", name: "fifth", color: .yellow),
                         GraphElement(id: "f", name: "sixth", color: .magenta),
                         GraphElement(id: "g", name: "seventh", color: .orange),
                         GraphElement(id: "h", name: "eighth", color: .purple),
                         GraphElement(id: "i", name: "ninth", color: .brown)]
    
    @IBAction func closeObjectDrawer(sender: UIBarButtonItem) {
        self.slideMenuController()?.closeLeft()
        self.slideMenuController()?.closeRight()
    }
    
    override public func viewDidLoad() {
        
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


