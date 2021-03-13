//
//  ViewController.swift
//  Scene-Trans002
//
//  Created by 염성훈 on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier:
                                                                    "SecondVC") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else{
            return
        }
        self.present(uvc, animated: true)
    }
}

