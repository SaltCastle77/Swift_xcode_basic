//
//  NewsDetailController.swift
//  TableView_news
//
//  Created by 염성훈 on 2021/03/13.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet var ImageMain: UIImageView!
    @IBOutlet var LabelMain: UILabel!
    
    // 앞의 본문 리스트에서 다음의 두개의 값을 받아와야한다.
    // 1. 이미지 url
    // 2. desc
    
    var imageUrl:String?
    var docs: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ok?
        if let img = imageUrl{
            // 이미지를 가져와서 뿌린다!
            // Data
            if let data = try? Data(contentsOf: URL(string:
            img)!)
            {
            //Main Thread에서 일해야해서 비동기 처리해야한다.
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let d = docs {
            // 본문을 보여준다.
            self.LabelMain.text = d
            
        }
    }
}
