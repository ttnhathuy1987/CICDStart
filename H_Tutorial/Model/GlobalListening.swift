//
//  GlobalListening.swift
//  H_Tutorial
//
//  Created by Admin on 05/04/2022.
//

import Foundation

class GlobalParamsListening<T:NSObject>: ListeningProtocol {
    var key: String = ""
    var actionBlock: ()->Void = {}
    private var streamCenter = ListeningCenter()
    private var _data: T = T()
    
    
    var data : T {
        set {
            _data = newValue
            listening()
        }
        get {
            return _data
        }
    }
    
    
    init(owner:ListeningCenter, key: String, data:T, action:@escaping ()->Void) {
        self.streamCenter = owner
        self.key = key
        self.data = data
        self.actionBlock = action
    }
    
    func listening() {
        
    }
}
