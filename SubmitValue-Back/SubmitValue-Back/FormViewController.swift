//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 염성훈 on 2020/12/20.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        
        let ad = UIApplication.shared.delegate as? AppDelegate // AppDelegate 클래스의 인스턴스는 직접 생성할 수 없으며 현재 생성되어 있는 인스턴스를 참조해야한다.
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        

        self.presentingViewController?.dismiss(animated: true)
        
        
    }
}
