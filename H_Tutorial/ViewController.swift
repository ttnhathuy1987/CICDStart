//
//  ViewController.swift
//  H_Tutorial
//
//  Created by Admin on 02/03/2022.
//

import UIKit

class RootViewController: UIViewController {
    
    var name: String?
    var personal: People = People(age: 2)
    
    var example = MainScan()
    var stt = true

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vwMainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Demo Using Structure "
        // Do any additional setup after loading the view.
        fillValueName(nameData: "")
        example.startPrint(type: (stt) ? "A" : "B")
        stt.toggle()
        example.beginPrint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNotificationObserver()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func addNotificationObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let activeField = txtUserName, let keyboardHeight = keyboardSize?.height else { return }

        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        let activeRect = activeField.convert(activeField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(activeRect, animated: true)
    }

    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    func fillValueName(nameData: String) {
        name = nameData
        print("Personal Age: \(personal.age)")
        
    }
    
    @IBAction func clickStart(_ sender: Any) {
        
        example.startPrint(type: (stt) ? "A" : "B")
        stt.toggle()
        example.beginPrint()
//
//        self.txtUserName.resignFirstResponder()
//        let nextView = MainViewController.instantiate()
//        nextView.strUserName = self.txtUserName.text
//
//        if globalCurrentPeople != nil {
//            globalCurrentPeople!.name = self.txtUserName.text ?? ""
//        } else {
//            globalCurrentPeople = People(age: 10)
//            globalCurrentPeople!.name = self.txtUserName.text ?? ""
//        }
//
//        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func simpleQueues() {
      let queue = DispatchQueue(label: "com.bigZero.GCDSamples")
      
      queue.async {
          for i in 0..<5 {
              print("🔵 \(i) -\( Thread.current))")
          }
      }
      
      queue.async {
          for i in 0..<5 {
              print("⚾️ \(i) - \(Thread.current))")
          }
      }
      
      for i in 0..<10 {
          print("❤️ \(i) - \(Thread.current)")
      }
    }
}

extension RootViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
