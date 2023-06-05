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
        let animationView = LottieAnimationView(name: "loadballs")
        animationView.frame = CGRect(x: -40, y:view.bounds.height/3 , width: 500, height: 500)
        view.addSubview(animationView)

        animationView.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce) { (finished) in
            let home = self.storyboard?.instantiateViewController(identifier: "home") as! UITabBarController
            home.modalPresentationStyle = .fullScreen
            home.modalTransitionStyle = .crossDissolve
            self.present(home, animated: true)
        }
//        animationView.animationSpeed = Float(animationView.animation!.duration) / Float(duration)
       
       
    }


}

