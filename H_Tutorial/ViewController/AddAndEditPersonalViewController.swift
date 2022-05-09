//
//  AddAndEditPersonalViewController.swift
//  H_Tutorial
//
//  Created by Admin on 21/03/2022.
//

import UIKit

class AddAndEditPersonalViewController: UIViewController {

    @IBOutlet weak var vwAddView: UIView!
    @IBOutlet weak var vwEditView: UIView!
    
    
    // Path Edit Personal Info
    @IBOutlet weak var txtPersonalName: UITextField!
    @IBOutlet weak var txtPersonalAge: UITextField!
    @IBOutlet weak var txtPersonalBirthday: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentControler: EditViewModel?
    
    var activeTextField: UITextField?
    
    var isEditType: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vwAddView.isHidden = isEditType
        vwEditView.isHidden = !isEditType
        
        currentControler = EditViewModel.init(mainDelegate: self)
        txtPersonalBirthday.delegate = currentControler
        txtPersonalAge.delegate = currentControler
        txtPersonalName.delegate = currentControler
        
        if isEditType {
            currentControler?.fillDataPersonal()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func clickSavePersonalInfo(_ sender: Any) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true);
    }
}

extension AddAndEditPersonalViewController: EditViewModelProtocol {
    func activeDatePicker() {
        self.datePicker.isHidden = false;
    }
    
    func hiddenDatePicker() {
        self.datePicker.isHidden = true;
    }
}
