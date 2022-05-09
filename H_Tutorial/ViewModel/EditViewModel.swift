//
//  EditViewModel.swift
//  H_Tutorial
//
//  Created by Admin on 31/03/2022.
//

import Foundation
import UIKit

protocol EditViewModelProtocol {
    func activeDatePicker()
    func hiddenDatePicker()
}

extension EditViewModelProtocol {
    func activeDatePicker(){}
    func hiddenDatePicker(){}
}

class EditViewModel: NSObject {
    
    private var mainDelegate: AddAndEditPersonalViewController = AddAndEditPersonalViewController()
    
    var currentPersonal: People?
    
    init(mainDelegate:AddAndEditPersonalViewController) {
        self.mainDelegate = mainDelegate
    }
    
    func fillDataPersonal() {
        self.mainDelegate.txtPersonalAge.text = "\(globalCurrentPeople?.age ?? 10)"
        self.mainDelegate.txtPersonalName.text = "\(globalCurrentPeople?.name ?? "")"
        self.mainDelegate.txtPersonalBirthday.text = "\(Date.now)"
    }
    
}

extension EditViewModel: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.mainDelegate.txtPersonalBirthday {
            self.mainDelegate.view.endEditing(true)
            self.mainDelegate.activeDatePicker()
            return false
        }
        self.mainDelegate.hiddenDatePicker()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
