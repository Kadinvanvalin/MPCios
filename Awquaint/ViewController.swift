//
//  ViewController.swift
//  Awquaint
//
//  Created by Apprentice on 10/20/17.
//  Copyright © 2017 Apprentice. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCBrowserViewControllerDelegate {
    
    var appDelegate:AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.mcpHandler.setupPeerWithDisplayName(displayName: UIDevice.current.name)
        appDelegate.mcpHandler.setupSession()
        appDelegate.mcpHandler.advertiseSelf(advertise: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    WHAT IS THIS
    @IBAction func connectWithUser(sender: AnyObject){
        if appDelegate.mcpHandler.session != nil{
            appDelegate.mcpHandler.setupBrowser()
            appDelegate.mcpHandler.browser.delegate = self
            
            self.present(appDelegate.mcpHandler.browser, animated: true, completion: nil)
        }
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        appDelegate.mcpHandler.browser.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        appDelegate.mcpHandler.browser.dismiss(animated: true, completion: nil)
    }

}

