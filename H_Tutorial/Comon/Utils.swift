//
//  Utils.swift
//  H_Tutorial
//
//  Created by Admin on 15/03/2022.
//

import Foundation
import UIKit

protocol Storyboardable {
}

extension Storyboardable where Self: UIViewController {

    // MARK: - Properties

    static var storyboardName: String {
        return "Main"
    }

    static var storyboardBundle: Bundle {
        return .main
    }

    // MARK: -

    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Methods

    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }

        return viewController
    }

}

public extension UITableView {
    func registerListCell(cells:[Any]) {
        
    }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
    
}
