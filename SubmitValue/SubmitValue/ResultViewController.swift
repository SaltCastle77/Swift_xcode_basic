//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 염성훈 on 2020/12/20.
//

import UIKit

class ResultViewcontroller : UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    // 값을 받기 위한 변수 설정
    var paramEmail: String = ""
    
    var paramUpdate : Bool = true
    
    var paramInterval : Double = 0
    
    //ios 앱 생애주기에 따라서 데이터 로드 이후 값을 갱신
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated:true)
    }
}
