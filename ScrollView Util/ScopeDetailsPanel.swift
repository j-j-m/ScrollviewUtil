//
//  ScopeDetailsPanel.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/25/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation
import Eureka






class ScopeDetailsPanel: FormViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SegmentedRow<String>.defaultCellSetup = { cell, row in
            cell.backgroundColor = UIColor.black
            cell.tintColor = UIColor.white
        }
        tableView?.backgroundColor = .black
        
        form.removeAll()
        form +++ Section() <<< SegmentedRow<String>() { $0.options = ["One", "Two", "Three"] }
    }
    
    func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }}
