//
//  ViewController.swift
//  Devium
//
//  Created by Rodrigo  Ribeiro on 05/09/17.
//  Copyright © 2017 Rodrigo  Ribeiro. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var loginAction: NSButton!
    @IBOutlet weak var backgroundCity: NSImageView!
    
    private var myWindow: NSWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundCity.alphaValue = 0.4
        backgroundCity.canDrawSubviewsIntoLayer = true
        backgroundCity.animates = true
        backgroundCity.layer?.contentsGravity = kCAGravityResizeAspectFill
        backgroundCity.image = NSImage(named: "finalBG")
        
        
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        
        loginAction.attributedTitle = NSAttributedString(string: "Login", attributes: [ NSForegroundColorAttributeName : NSColor.white, NSParagraphStyleAttributeName : pstyle, NSFontAttributeName: NSFont(name: "8BIT WONDER", size: 8.0)!])

    }
    
    @IBAction func tryToLogin(_ sender: NSButton) {
     
        self.view.window?.windowController?.close()
        //set view controller
        let storyBoard = NSStoryboard(name: "Main", bundle: nil) as NSStoryboard
        let myViewController = storyBoard.instantiateController(withIdentifier: "ChatViewController") as! ChatViewController
        
        //set window
        myWindow               = NSWindow(contentViewController: myViewController)
        let myWindowController = NSWindowController(window: myWindow)
        
        //customize next window
        myWindowController.window?.titleVisibility = .hidden
        myWindowController.window?.titlebarAppearsTransparent = true
        myWindowController.window?.styleMask.insert(.fullSizeContentView)

        //show window
        myWindowController.showWindow(ViewController.self)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    

}

