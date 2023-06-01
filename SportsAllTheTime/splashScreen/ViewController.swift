//
//  ViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 20/05/2023.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        let home = self.storyboard?.instantiateViewController(identifier: "home") as! UITabBarController
        home.modalPresentationStyle = .fullScreen
        home.modalTransitionStyle = .crossDissolve
        self.present(home, animated: true)
       
    }


}

