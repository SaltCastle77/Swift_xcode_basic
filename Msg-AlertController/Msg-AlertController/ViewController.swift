//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 염성훈 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var result: UILabel!
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel){(_) in
            self.result.text = "취소버튼을 클릭하셨습니다."
        } // 취소 버튼
        
        let ok = UIAlertAction(title:"확인", style: .default){(_) in
            self.result.text = "확인버튼을 클릭하셨습니다."
        }// 확인 버튼
        
        let exec = UIAlertAction(title:"실행", style: .destructive) {(_) in
            self.result.text = "실행버튼을 클릭하셨습니다."
        }// 실행버튼
        let stop = UIAlertAction(title: "중지", style: .default){(_) in
            self.result.text = "중지 버튼을 클릭하셨습니다."
        } // 중지 버튼
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: false)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes 사용자에게 로그인"
        let message = "사용자의 Apple ID sqlqro@naver.com의 암호를 입력하십시오."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        let ok = UIAlertAction(title: "로그인", style: .default){(_) in
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \( tf.text!)입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호" //안내 메세지
            tf.isSecureTextEntry = true // 비밀번호
        })
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소 ", style: .cancel)
        
        let ok = UIAlertAction(title: "확인", style: .default){(_) in
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text // 두번째 텍스트 필드이기 떄문에 두번째 배열로 지정한다.
            
            if loginId == "hysung01" && loginPw == "yeomsung01!" {
                self.result.text = "인증되었습니다."
            } else {
                self.result.text = "인증에 실패하였습니다."
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 아이디 필드 추가
        
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "아이디" // 미리 보여줄 안내 메시지
            tf.isSecureTextEntry = false // 입력시 별표 표시 안하기
        })
        
        // 비밀번호 필드 추가
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: false)
    }
}

