//
//  MainViewController.swift
//  H_Tutorial
//
//  Created by Admin on 14/03/2022.
//

import Foundation
import UIKit

class MainViewController : UIViewController, Storyboardable {
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    var strUserName: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    var leftVC: MenuViewController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentPeople = globalCurrentPeople {
            lblWelcome.text = "Welcome, \(currentPeople.name)"
            self.navigationItem.title = "Welcome, \(currentPeople.name)"
        }
        
        configureNavigation()
        initProfileViewController()
        addGesture()
    }
    
    func setupObserver() {
        
    }
    
    private func configureNavigation() {
        self.title = "Main"
        let leftButton = UIBarButtonItem(image: UIImage(named: "icon_menu"), style: .plain, target: self, action: #selector(self.menuAction(_ :)))
        self.navigationItem.leftBarButtonItem = leftButton
    }

    @objc func menuAction(_ sender: Any) {
        showLeftViewController()
    }
    
    fileprivate func initProfileViewController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        let leftVC = MenuViewController.instantiate()
        leftVC.delegate = self
        if let frame = windowScene.windows.first?.frame {
            leftVC.resetWidth(parentWidth: frame.width)
            leftVC.shadowColor = UIColor(red: 46.0/255, green: 24.0/255, blue: 82.0/255, alpha: 0.7)
            leftVC.hasShadow = true
            windowScene.windows.first?.addSubview(leftVC.view)
        }
        self.leftVC = leftVC
        
    }
    
    fileprivate func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapInSelf))
        self.view.addGestureRecognizer(gesture)
    }
    
    fileprivate func showLeftViewController() {
        leftVC?.expand()
    }
    
    @objc func tapInSelf() {
        leftVC?.close()
    }
    
}

extension MainViewController: MenuViewDelegate {
    func actionChoiceAtCell(index: IndexPath) {
        print("CLick at index: \(index.row)")
        leftVC?.close()
        if index.row == 1 {
            let addPersonalVC = AddAndEditPersonalViewController.init(nibName: "AddAndEditPersonalViewController", bundle: nil)
            addPersonalVC.isEditType = false
            self.navigationController?.pushViewController(addPersonalVC, animated: true)
        } else if index.row == 2 {
            let addPersonalVC = AddAndEditPersonalViewController.init(nibName: "AddAndEditPersonalViewController", bundle: nil)
            addPersonalVC.isEditType = true
            self.navigationController?.pushViewController(addPersonalVC, animated: true)
        }
    }
}
