//
//  ViewController.swift
//  TableView_news
//
//  Created by 염성훈 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var TableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개? 숫자를 반환해야한다.
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇? 반복 10번인가?
        // 2가지!
        // 1번 방법 - 임의의 셀 만들기
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
    }
    
    // tableview 테이블로 된 뷰- 여러개의 행이 모여 있는 목록 뷰(화면)
    // 정갈하게 보여줄려고 사용한다. - 전화번호부
    
    // 1. 데이터 무엇? - 전화번호부 목록
    // 2. 데이터 몇개? - 100, 10000, 10000
    // (옵션) 데이터 행 눌렀다! - 클릭
    
}

