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
    @IBOutlet weak var backgroundGradient: NSImageView!
    @IBOutlet var backgroundCodes: NSTextView!
    
    @IBOutlet weak var usernameField: NSTextField!
    private var myWindow: NSWindow!
    @IBOutlet weak var codeSide: NSBox!
    
    var hackingGoingOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundGradient.alphaValue = 0.3
        backgroundCity.alphaValue = 0.8
        backgroundCity.canDrawSubviewsIntoLayer = true
        backgroundCity.animates = true
        backgroundCity.layer?.contentsGravity = kCAGravityResizeAspectFill
        backgroundCity.image = NSImage(named: "finalBG")
    
        fillHackingCodes()
        
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        
        loginAction.attributedTitle = NSAttributedString(string: "Login", attributes: [ NSForegroundColorAttributeName : NSColor.white, NSParagraphStyleAttributeName : pstyle, NSFontAttributeName: NSFont(name: "8BIT WONDER", size: 8.0)!])

    }
    
    @IBAction func tryToLogin(_ sender: NSButton) {
     
        if usernameField.stringValue != "Gijo" {
            showWrongPasswordView()
        
        } else {
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
        

        
    }
    
    func showWrongPasswordView() {
        
        let wrongPassWarningView       = NSBox(frame: CGRect(x: self.view.frame.width * 2, y: 0, width: codeSide.frame.width, height: codeSide.frame.height))
        wrongPassWarningView.fillColor    = Theme.primaryColor
        wrongPassWarningView.boxType      = .custom
        wrongPassWarningView.borderWidth  = 0
        wrongPassWarningView.cornerRadius = 0
        wrongPassWarningView.alphaValue   = 1
        self.view.addSubview(wrongPassWarningView)
        
        let wrongPassWarningImage = NSImageView(frame: CGRect(x: self.view.frame.width * 2, y: 0, width: codeSide.frame.width, height: codeSide.frame.height))
        wrongPassWarningImage.alphaValue = 0.4
        wrongPassWarningImage.canDrawSubviewsIntoLayer = true
        wrongPassWarningImage.animates = true
        wrongPassWarningImage.layer?.contentsGravity = kCAGravityResizeAspectFill
        wrongPassWarningImage.image = NSImage(named: "passoff")
        self.view.addSubview(wrongPassWarningImage)
        
        NSAnimationContext.runAnimationGroup({ _ in
            NSAnimationContext.current().duration = 0.4
            
            wrongPassWarningView.animator().frame  = CGRect(x: codeSide.frame.origin.x, y: 0, width: codeSide.frame.width, height: codeSide.frame.height)
            wrongPassWarningImage.animator().frame = CGRect(x: codeSide.frame.origin.x, y: 0, width: 780, height: 580)
            
        }, completionHandler:{
            print("Animation completed")
            
            
        })
        
        let labelPassOff = NSTextField()
        labelPassOff.frame = CGRect(x: codeSide.frame.origin.x + 30, y: 100, width: 600, height: 300)
        labelPassOff.textColor = NSColor.white
        labelPassOff.font      = NSFont(name: "Press Start 2P", size: 13)
        labelPassOff.alignment = .left
        labelPassOff.isEditable = false
        labelPassOff.isSelectable = false
        labelPassOff.drawsBackground = false
        labelPassOff.isBezeled = false
        labelPassOff.alignment = .natural
        labelPassOff.lineBreakMode = .byClipping
        labelPassOff.cell?.isScrollable = true
        labelPassOff.cell?.wraps = false
        labelPassOff.maximumNumberOfLines = 3
        self.view.addSubview(labelPassOff)
        
        labelPassOff.setLabelWithTypeAnimation(typedText: "<wrong *| Password:Init*RegretForMissingIt> \nThat was close. \nThese guys could be hackers...", characterInterval: 0.09)
        
        let labelPassOffInitializing = NSTextField()
        labelPassOffInitializing.frame = CGRect(x: codeSide.frame.origin.x + 30, y: 0, width: 600, height: 300)
        labelPassOffInitializing.textColor = NSColor.red
        labelPassOffInitializing.font      = NSFont(name: "Press Start 2P", size: 13)
        labelPassOffInitializing.alignment = .left
        labelPassOffInitializing.isEditable = false
        labelPassOffInitializing.isSelectable = false
        labelPassOffInitializing.drawsBackground = false
        labelPassOffInitializing.isBezeled = false
        labelPassOffInitializing.alignment = .natural
        labelPassOffInitializing.lineBreakMode = .byClipping
        labelPassOffInitializing.cell?.isScrollable = true
        labelPassOffInitializing.cell?.wraps = false
        labelPassOffInitializing.maximumNumberOfLines = 3
        self.view.addSubview(labelPassOffInitializing)
        
        let when = DispatchTime.now() + 7
        DispatchQueue.main.asyncAfter(deadline: when) {
            labelPassOffInitializing.setLabelWithTypeAnimation(typedText: "Initializing assassination function...", characterInterval: 0.0800)
            
        }
        
        let whenAnswer = DispatchTime.now() + 12
        DispatchQueue.main.asyncAfter(deadline: whenAnswer) {
            labelPassOff.stringValue = ""
            labelPassOff.setLabelWithTypeAnimation(typedText: "Oh... <FCK>!", characterInterval: 0.20)
        }
        
        let labelPassOffInitied = NSTextField()
        labelPassOffInitied.frame = CGRect(x: codeSide.frame.origin.x + 30, y: -20, width: 600, height: 300)
        labelPassOffInitied.textColor = NSColor.white
        labelPassOffInitied.font      = NSFont(name: "Press Start 2P", size: 13)
        labelPassOffInitied.alignment = .left
        labelPassOffInitied.isEditable = false
        labelPassOffInitied.isSelectable = false
        labelPassOffInitied.drawsBackground = false
        labelPassOffInitied.isBezeled = false
        labelPassOffInitied.alignment = .natural
        labelPassOffInitied.lineBreakMode = .byClipping
        labelPassOffInitied.cell?.isScrollable = true
        labelPassOffInitied.cell?.wraps = false
        labelPassOffInitied.maximumNumberOfLines = 3
        self.view.addSubview(labelPassOffInitied)
        
        let whenInit = DispatchTime.now() + 15
        DispatchQueue.main.asyncAfter(deadline: whenInit) {
            labelPassOffInitied.setLabelWithTypeAnimation(typedText: "var : atomic.front.wave = gijotrix \nlife.addsubview(don't be afraid) \nGenerate Stream.IO*InMid3D\n-> String; [Danone is Not Milk] \nJust recov*r {u} paxxs0rd \ndude -> man();", characterInterval: 0.0400)
        }
        
        let delayToGoBack = DispatchTime.now() + 30
        DispatchQueue.main.asyncAfter(deadline: delayToGoBack) {
            
            NSAnimationContext.runAnimationGroup({ _ in
                NSAnimationContext.current().duration = 1
                
                labelPassOff.removeFromSuperview()
                labelPassOffInitializing.removeFromSuperview()
                labelPassOffInitied.removeFromSuperview()
                wrongPassWarningView.animator().alphaValue = 0.0
                wrongPassWarningImage.animator().alphaValue = 0.0
                
            }, completionHandler:{
                wrongPassWarningView.removeFromSuperview()
                wrongPassWarningImage.removeFromSuperview()
            })
        }
        
    }

    func fillHackingCodes() {
        self.backgroundCodes.setTextWithTypeAnimation(typedText: "var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man(); var : atomic.front.wave = gijotrix \nnblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK \nstring output = 'Matrix'\nthoughts exploding : thousand pieces\nstruct group_info init_groups = .usage = atomic_init(2)\ndude -> man();", characterInterval: 0.010)
    }
}

extension NSTextField {
    
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.stringValue = ""
            
            for (index, character) in newText.characters.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.stringValue.append(character)
                }
            }
        }
    }
    
    func setLabelWithTypeAnimation(typedText: String, characterInterval: TimeInterval = 0.25) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            for character in typedText.characters {
                DispatchQueue.main.async {
                    self.stringValue = self.stringValue + String(character)
                }
                Thread.sleep(forTimeInterval: characterInterval)
            }
        }
    }
}

extension NSTextView {
    
    func setTextWithTypeAnimation(typedText: String, characterInterval: TimeInterval = 0.25) {
        
        self.alphaValue        = 0.2
        self.string            = ""
        self.isEditable        = false
        self.drawsBackground   = false
        self.isSelectable      = false
        self.font              = NSFont(name: "Press Start 2P", size: 9)
        self.textColor         = NSColor.white
        string = ""
        
        DispatchQueue.global(qos: .userInteractive).async {
            for character in typedText.characters {
                DispatchQueue.main.async {
                    self.scrollToEndOfDocument(nil)
                    self.string = self.string! + String(character)
                }
                Thread.sleep(forTimeInterval: characterInterval)
            }
        }
    }
}

