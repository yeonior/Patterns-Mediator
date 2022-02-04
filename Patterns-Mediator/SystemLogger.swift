//
//  SystemLogger.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

final class SystemLogger: Component {
    
    var controller: Mediator?
    
    func log(pitch: Double) {
        print("Logging pitch \(pitch) degrees")
    }
}
