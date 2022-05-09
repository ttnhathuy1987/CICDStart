//
//  ListeningCenter.swift
//  H_Tutorial
//
//  Created by Admin on 31/03/2022.
//

import Foundation
import UIKit

protocol ListeningProtocol {
    var key:String {get}
    func listening()
}

class ListeningCenter {
    
    static let defaultCenter = ListeningCenter()
    
    private var listListening = [ListeningProtocol]()
    private var _number = Int()
    var number : Int {
        set {
            _number = newValue
            notify()
        }
        get {
            return _number
        }
    }
    
    func sinkDataWithKey(key:String, object:AnyObject?) {
        for observer in listListening.filter({ item in
            item.key != key
        }) {
            observer.listening()
        }
    }
    
    func attachObserver(observer : ListeningProtocol){
        listListening.append(observer)
        }
        
    func removeObserver(observer : ListeningProtocol) {
        listListening = listListening.filter{ $0.key != observer.key }
    }
        
    private func notify(){
        for observer in listListening {
            observer.listening()
        }
    }
}
