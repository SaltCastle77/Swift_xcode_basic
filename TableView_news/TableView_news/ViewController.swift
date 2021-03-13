//
//  ViewController.swift
//  TableView_news
//
//  Created by 염성훈 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String, Any>>?
    // 1. http 통신 방법
    // 2. JSON 데이터 형태
    // 3. 테이블 뷰의 데이터 매칭 <-  데이터를 가져왔다고 통보해야한다. 그리기!시작한다.
    // !!!!!! 네트워크 통신과 화면 그리기의 관계 : 네트워크 통신을하는 애들은 백그라운드에 위치한다.
    
    func getNews() {
        // axios통신과 같은 방법이다.
        let url : String = "https://newsapi.org/v2/top-headlines?country=kr&category=business&apiKey=112f45914dfc44ed9578fb2bd34021df"
        let task = URLSession.shared.dataTask(with: URL(string:
            url)!) {(data, response, error) in
            
            if let dataJson = data {
                
                do { //오류 상황에 대해서는 코드를 처리하는 do. catch를 실행해야한다.왜? json이 Json파일이 아니면 JSON 직렬화가 안되기 떄문이다.
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any> // value가 뭔지 모르면 Any를 사용한다.
//                    print(json)
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    DispatchQueue.main.async { //main에서화면을 그려줘야한다. 메인에서 일을해라 세팅이되면 비동기로 그려라.
                        self.TableViewMain.reloadData() //데이터를 받아왔다고 TableViewMain에 통보를 해줘야한다.
                    }
//                    for (idx, value) in articles.enumerated() {
//                        if let v = value as? Dictionary<String,Any> {
//                            print("\(v["title"])")
//                        }
//                    }
                }
                catch {
                    
                }
            }
        }
        
        task.resume()
    }
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개? 숫자를 반환해야한다.
        if let news = newsData {
            return news.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇? 반복 10번인가?
        // 2가지!
        // 1번 방법 - 임의의 셀 만들기
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
        // as? as! - 자식 클래스가 맞는 방법
        // as? : 이거 맞아?
        // as! : 이거 맞아!
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        let idx = indexPath.row
        
        if let news = newsData {
            
            let row = news[idx]
            
            if let r = row as? Dictionary<String,Any> {
                if let title = r["title"] as? String{
                    cell.LabelText?.text = title
                }
            }
        }
        
        return cell
    }
    
    // 1. 옵션 - 클릭감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil) // main스토리보드라 이름이 Main
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
       
        if let news = newsData {
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String,Any> {
                
                if let imageUrl = r["urlToImage"] as? String{
                    controller.imageUrl = imageUrl
                }
                if let dosc = r["description"] as? String {
                    controller.docs = dosc
                }
            }
        }
        
        //이동! -> 수동!
//        showDetailViewController(controller, sender: nil)
    }
    
    // 2. 세그 웨이
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String,Any> {
                            
                            if let imageUrl = r["urlToImage"] as? String {
                                controller.imageUrl = imageUrl
                            }
                            if let dosc = r["description"] as? String {
                                controller.docs = dosc
                            }
                        }
                    }
                }
            }
        }
        //이동 ! -> 자동!
    }
    
    
    // 1. 디테일(상세)화면 만들기
    // 2. 값을 보내기 2가지
    // 3. 화면 이동 (이동하기전에 값을 미리 셋팅해야한다!!!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }
}

