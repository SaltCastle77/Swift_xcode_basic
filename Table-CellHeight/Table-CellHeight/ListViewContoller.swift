//
//  ListViewContoller.swift
//  Table-CellHeight
//
//  Created by 염성훈 on 2020/12/30.
//

import UIKit

class ListViewController: UITableViewController {
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
    
    @IBAction func add(_ sender: Any){
        
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주시요", preferredStyle: .alert)
        
        // 알림창에 입력폼을 추가한다.
        
        alert.addTextField() {
            (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        // OK 버튼 객체를 생성한다. 아직 알림창 객체에 버튼이 등록되지 않은 상태
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title:"취소", style: .cancel, handler:nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.text = list[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        
        return cella
    }
    
    // 셀프 사이징이 생기고나서 부터는 직접 높이값을 계산해서 마ㅈ출 필요가 없다.
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let row = self.list[indexPath.row]
//
//        // 높이를 조절해준다. 기본 높이 60 + 글의 기링가 30자를 넘어갈 떄마다 20만큼 높일 늘려준다.
//
//        let height = CGFloat(60+(row.count / 30) * 20)
//        return height
//
//    }
//
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}
