//
//  WindowSub.swift
//  Devium
//
//  Created by Rodrigo  Ribeiro on 05/09/17.
//  Copyright © 2017 Rodrigo  Ribeiro. All rights reserved.
//

import Cocoa

class CustomWindow: NSWindow {
    override var canBecomeKey: Bool {
        get { return true }
    }
}
