//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 염성훈 on 2020/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    // 화면이 표시될때마다 갱신되는 method
    override func viewWillAppear(_ animated: Bool) {
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        
        if let update = ad?.paramUpdate {
            resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분 마다"
        }
        
    }
}

