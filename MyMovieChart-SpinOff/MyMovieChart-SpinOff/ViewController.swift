//
//  ViewController.swift
//  MyMovieChart-SpinOff
//
//  Created by 염성훈 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// 테이블을 구성하기 위해 필요한 메소드를 정의한다.
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 임의로 5개의 셀을 생성한다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! // 테이블 뷰에 재사용 큐 이용해서 cell로 넣어준다.
        
        cell.textLabel?.text = "\(indexPath.row)번째 데이터 입니다."
        
        return cell
    }
}
// 테이블에서 발생하는 액션/이벤트와 관련된 메소드를 정의한다.
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row)번째 데이터가 클릭됨.")
    }
}

