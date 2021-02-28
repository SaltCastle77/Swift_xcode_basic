//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 염성훈 on 2020/12/28.
//

import UIKit
class ListViewController : UITableViewController {
    
    override func viewDidLoad() {
        // 호핀 API 호출을 위한 URI를생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        
        let apiURI: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        let log = NSString(data:apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\(log)")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            
            let movies = hoppin["movies"] as! NSDictionary
            
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                self.list.append(mvo)
                
            }
            
        } catch {
            
        }
        
    }
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"

        let url: URL! = URL(string: row.thumbnail!)
        
        let imageData = try! Data(contentsOf: url)
        
        cell.thumbnail.image = UIImage(data:imageData)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 콘솔로그창에 아래의 메세지가 뜨게 된다.
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
}
