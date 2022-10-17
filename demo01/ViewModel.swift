//
//  ViewModel.swift
//  demo01
//
//  Created by ToThang on 10/17/22.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {
    
    var inputSequence = BehaviorRelay(value: "")
    
    func handle(inp: String) {
        print(inp)
        let count: Int = inp.count
        let result = "Length is " + String(count)
        inputSequence.accept(result)
    }
}
