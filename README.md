# 꼼꼼한 재은씨의 Swift 기본편 핵심정리

## Chap8. 테이블 뷰를 이용한 데이터 목록구현

- 내비게이션 컨트롤러를 선택하면 테이블 뷰 컨트롤러가 덤으로 추가된다.

- 테이블 뷰 오브젝트를 선택하고 [Editor] -> [Embed In] -> [Navigation Contoller] 방식으로 추가해도되지만 네비게이션 컨트롤러를 선택하면 TableView가 자동으로 따라온다.
- 주의할점! 처음에 설정된 뷰 컨트롤러를 삭제하면 initial View Controller를 반드시 지정해줘야한다. 

![image-20210403184655760](README.assets/image-20210403184655760.png){: width="100" height="100"}

- ListViewController.swift 

> 네비게이션 바에서 +를 클릭했을때 알람창이 뜨고 거기서 추가될 글을 작성할 수 있도록 만들고 싶다. 다음과 같이 구현

```swift
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
    
    // 셀 높이를 조절해줄 메소드 가로 행에 대한 정보를 인자 값으로 받고, 그 행의 높이를 얼마로 계산하여 반환해 줄지 정한다.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        // 높이를 조절해 준다.
        let height = CGFloat(60 + (row.count / 30) * 20) // CGFloat는 메소드 반환 타입을 일치시켜줄 목적으로 사용한 객체이다.
        
        return height
    }   
}

```

- `UIAlertController` 객체를 먼저 형성해준다. 3번째 값이 알람창의 스타일을 결정하는 항목이다. `actionSheet` 와 `alert` 로 선택할 수 있다.
- `actionSheet`는 알림창 내부에 입력 필드를 넣을 경우 사용할 수 없다.
- `addTextField`은 입력 폼을 추가 하는 메소드를 추가한다. 클로저에 대한 이해 가 필요

- 알림창에 연결될 버튼 객체를 형성해줘야한다. 세 번째 인자 값을 사용하여 버튼 클릭에 대한 액션을 정의해 줄 수있다.

### 후행클로저

```swift
  let ok = UIAlertAction(title: "OK", style: .default){(_) in
            // 배열에 입력된 값을 추가 하고 테이블 갱신
            if let title =  alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
```

- 이부분이 후행클로저 인데  `UIAlertAction` 클래스의 세번쨰 인자값을 사용하면 클릭했을때의 어떤 행동을 할지에 대한 것을 정의해 줄 수 있다. 

  저 부분이 이해가 안갔었는데 3번째 인자에 함수를 넣어 기능을 동작하게 해야하는데 저렇게 빼서 클로저 형식으로 넣어도 된다.



### Nil-Coalescing Operatior

- A ?? B

> 만약 A가 nil이 아닐 경우 옵셔널을 해제하고, nil일 경우 대신 B값을 사용하라는 말이다. 

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell" 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        // cell 아이디를 가진 셀을 읽어와 옵셔널 해제! 근대 그값이 nildㅣ면 UITaleVIewCell 인스턴스를 새로 생성해!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        return cell
        }
```

### 셀프 사이징

- 직접 높이값을 게싼해서 맞추지 않아도 콘텐츠에 따라 자동으로 동적으로 높이를 결정해주는 것

```swift
  override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50 // 대충의 높이값
        self.tableView.rowHeight = UITableView.automaticDimension
    }
```

- `viewWillAppear` :  뷰가 나타나기 직전에 호출된다. `viewDidload`랑은 다른 점이 있는데 앱의 완전한 초기화 작업은 `viewDidLoad`에서 처리해도 되지만 다른 뷰에서 갔다가 다시 돌아오는 상황에서는 viewWillAppear에서 해주면된다.
- 참고자료 : https://zeddios.tistory.com/43





