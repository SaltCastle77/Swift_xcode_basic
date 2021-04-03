//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 염성훈 on 2021/04/03.
//

import UIKit

class ListViewController : UITableViewController {
    // 테이블 뷰에 연결될 빈 배열을 정의해준다.
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        // 알림창에 입력 폼을 출력한다.
        alert.addTextField() { (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        // ok버튼 객체 생성
        let ok = UIAlertAction(title: "OK", style: .default){(_) in
            // 배열에 입력된 값을 추가 하고 테이블 갱신
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        
        // cancel 객체 생성
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 알림창 객체에 버튼 객체를 등록한다.
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    // 셀 안의 내용을 넣어주는 함수이다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell" 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        // cell 아이디를 가진 셀을 읽어와 옵셔널 해제! 근대 그값이 nil 이면 UITaleVIewCell 인스턴스를 새로 생성해!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다. 별도로 속성을 지정해주지 않으면 글자가 아무리 길어도 한줄로만 표현된다. 0으로 하면 글자 길이에 따라 높이가 자동으로 늘어남
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
//    // 셀 높이를 조절해줄 메소드 가로 행에 대한 정보를 인자 값으로 받고, 그 행의 높이를 얼마로 계산하여 반환해 줄지 정한다.
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//        // 높이를 조절해 준다.
//        let height = CGFloat(60 + (row.count / 30) * 20) // CGFloat는 메소드 반환 타입을 일치시켜줄 목적으로 사용한 객체이다.
//
//        return height
//    }
    // 셀프 사이징
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50 // 대충의 높이값
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}
