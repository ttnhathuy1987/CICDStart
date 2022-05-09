//
//  MainScan.swift
//  H_Tutorial
//
//  Created by Admin on 27/04/2022.
//

import UIKit

//class MainScan: NSObject {
//
//}

protocol Scanale {
    func printSelf()
    func disconnect()
}

extension Scanale {
    
    func printSelf() {
        
    }
    
    func disconnect() {
        
    }
    
    static func printMethod() {
        
    }
    
}

class MainScan: Scanale  {
    
    var tInst: Scanale?
    
    func startPrint(type: String) {
        if(type == "A") {
            let theClass = A.self
            tInst = theClass.init()
            
        } else if(type == "B") {
            let theClass = B.self
            tInst = theClass.init()
        }
    }
    
    func beginPrint() {
        tInst?.printSelf()
    }
    
    func dissconnect() {
        tInst?.disconnect()
    }
    
}

class A: Scanale {
    func disconnect() {
        
    }
    
    
    required init() {
    }
    
    func printSelf() {
        print("Objecrt A")
    }
    
    static func printMethod() {
        print("Objecrt A")
    }
    
}

class B: Scanale {
    func disconnect() {
    
    }
    
    
    required init() {
    }
    
    func printSelf() {
        print("Objecrt B")
    }
    
    static func printMethod() {
        print("Objecrt B")
    }
}


