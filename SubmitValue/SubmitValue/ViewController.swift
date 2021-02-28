//
//  ViewController.swift
//  SubmitValue
//
//  Created by 염성훈 on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUPdateText: UILabel!
    
    @IBOutlet var intervalText: UILabel!
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUPdateText.text = "갱신함"
        } else {
            self.isUPdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        // 다운캐스팅, 현재 paramEmail,paramUpdate는 UIViewController에 정의되어 있지않고
        // ResultViewcontroller에 정의되어 있음. 따라서 as?로 다운캐스팅해줘야한다.
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier:
                                                                    "RVC") as? ResultViewcontroller else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
        
    }
    //세그웨이를 실행할때는 예외없이 prepare메소드를 호출하게 되어 있다. 따라서 세그웨이를 통해
    //값을 전달하고 싶다면 아래와 같이 구성하면된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
                
        guard let rvc = dest as? ResultViewcontroller else {
            return
        }
        
        // 값 전달
        
        rvc.paramEmail = self.email.text! //email
        rvc.paramUpdate = self.isUpdate.isOn // 자동갱신여부
        rvc.paramInterval = self.interval.value // 개신주기
     }
    
}

