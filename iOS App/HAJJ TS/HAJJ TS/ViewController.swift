
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseMessaging

class ViewController: UIViewController {

    @IBOutlet weak var IDtextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func GetStartButton(_ sender: Any) {
        
        guard let ID = IDtextField.text,
            ID != ""
            else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill the ID field")
                return
        }
        
        //***** for realTime database
        let ref = Database.database().reference()
        let userRef = ref.child("PID").childByAutoId()
        let values = ["ID": ID ]
        userRef.setValue(values) { (err, ref) in
            if err != nil {
                print (err)
                return
            }
            print("saved user successfully")
            AlertController.showAlert(self, title: "Success", message: "  ID is added to the database")
             self.IDtextField.text = ""
           
            
        }
        //end
        
  



    }
    
    
}


