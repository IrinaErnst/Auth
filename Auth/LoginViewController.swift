//
//  LoginViewController.swift
//  Auth
//
//  Created by Irina Ernst on 9/26/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    //var safariVC: SFSafariViewController
    let numberOfOctocatImages = 10
    var octocatImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpImageViewAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton){
        //TODO: login
        
    }
    
    func setUpImageViewAnimation() {
        
    }
}

extension LoginViewController {
    
    private func configurateButton(){
        
    }
    
}
