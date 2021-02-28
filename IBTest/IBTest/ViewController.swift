//
//  ViewController.swift
//  IBTest
//
//  Created by 염성훈 on 2020/12/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn03(_ sender:Any) {
        self.uiTitle03.text = "Button01 Clicked"
        
    }
    
    @IBAction func clickBtn04(_ sender:Any){
        self.uiTitle04.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button01 Clicked"
    }
}

