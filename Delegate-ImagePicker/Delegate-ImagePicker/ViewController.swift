//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 염성훈 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        // 델리게이트 지정
        picker.delegate = self
        
        self.present(picker, animated: true)
    }
}
// MARK:- 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 이미지 피커에서 이미지 선택안하고 취소했을떄 호출되는 메서드
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 알림창과 겹치기 때문에 이미지 피커를 먼저 닫고 알림창을 호출한다.
        picker.dismiss(animated:false) { () in
        
        // 알림창 호출
        let alert = UIAlertController(title:"취소하였습니다.", message: "이미지 선택이 취소되었습니다", preferredStyle:.alert)
        
        alert.addAction(UIAlertAction(title:"확인", style: .cancel))
        self.present(alert, animated: true)
        
        }
    }
    
    // 이미지 피커에서 이미지를 선택했을 떄 호출되는 메소드
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false) { () in
            // 이미지를 뷰에 표시
            // info에 사용자가 선택된 이미지정보다 딕셔너리 타입으로 전달되어 있다
            // 읽어온 값은 이미지 데이터를 담고 있지만 아직 객체 타입이 Any라서 UIImage타입으로 캐스팅
            let img =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

