//
//  ChatViewController.swift
//  Devium
//
//  Created by Rodrigo  Ribeiro on 05/09/17.
//  Copyright © 2017 Rodrigo  Ribeiro. All rights reserved.
//

import Cocoa

class ChatViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenLoading()
        windowSizeOnScreen()
        print("i got it")
 
    }
    
    func windowSizeOnScreen() {
//        self.view.frame = CGRect(x: 0, y: 0, width: (NSScrxeen.main()?.frame.width)! / 1.7, height: (NSScreen.main()?.frame.height)! / 1.15)
    }
    
    func screenLoading() {
        
        NSAnimationContext.runAnimationGroup({_ in
            NSAnimationContext.current().duration = 5.0
            
            
            
        }, completionHandler:{
            //In here we add the code that should be triggered after the animation completes.
            print("Animation completed")
        })
    
    }
    
}
