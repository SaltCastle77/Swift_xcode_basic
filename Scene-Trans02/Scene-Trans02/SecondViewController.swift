//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by 염성훈 on 2020/12/17.
//

import UIKit
class SecondVidewController: UIViewController {

    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: Any) {
    _ = self.navigationController?.popViewController(animated: true)
    }

    
}
