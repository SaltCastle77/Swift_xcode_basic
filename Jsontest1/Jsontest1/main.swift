//
//  main.swift
//  Jsontest1
//
//  Created by 염성훈 on 2020/12/26.
//

import Foundation

protocol SomeProtocol {
    var mustBeSettable : Int {get set}
    var doesNotNeedtoBeSettable : Int { get }
}

protocol FullyNamed  {
    var fullName : String { get }
}

struct Person : FullyNamed {
    
    var name : String
    var fullName :String {
        return name
    }
}

var john = Person(name: "john Appleseed")

john.fullName = "Yeom"

