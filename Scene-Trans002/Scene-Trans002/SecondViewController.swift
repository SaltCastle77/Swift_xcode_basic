import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func moveBackPresent(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

