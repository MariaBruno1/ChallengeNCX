//
//  DietViewController.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 03/04/24.
//

import UIKit
import SwiftUI

class DietViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBSegueAction func test(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: FolicAcid(currentColor: .blue))
    }
    
}
