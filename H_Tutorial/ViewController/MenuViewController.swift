//
//  MenuViewController.swift
//  H_Tutorial
//
//  Created by Admin on 15/03/2022.
//

import Foundation
import UIKit

@objc protocol MenuViewDelegate {
   @objc optional func actionChoiceAtCell(index: IndexPath)
}

class MenuViewController: CustomSlideViewController,Storyboardable {
    @IBOutlet weak var tbvListMenu: UITableView!
    
    var delegate: MenuViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvListMenu.register(UINib(nibName: "FirstViewCellXib", bundle: nil), forCellReuseIdentifier: "FirstViewCellXib")
        tbvListMenu.layer.cornerRadius = 8.0
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.actionChoiceAtCell?(index: indexPath)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewCell") as? SecondViewCell{
                cell.lblText.text = "Load from storyboard"
                return cell
            }
            return UITableViewCell()
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstViewCellXib") as? FirstViewCellXib{
                cell.lblText.text = "Load from Xib"
                return cell
            }
            
            return UITableViewCell()
        }
    }
    
    
}
