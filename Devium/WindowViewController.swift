//
//  WindowViewController.swift
//  Devium
//
//  Created by Rodrigo  Ribeiro on 05/09/17.
//  Copyright © 2017 Rodrigo  Ribeiro. All rights reserved.
//

import Cocoa

class WindowViewController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.isMovableByWindowBackground = true
        window?.isOpaque = false
        window?.backgroundColor = NSColor.clear
        window?.becomeKey()
    }
    
    

}


