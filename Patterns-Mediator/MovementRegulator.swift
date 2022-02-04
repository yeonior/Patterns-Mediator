//
//  MovementRegulator.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

final class MovementRegulator: Component {
    
    var controller: Mediator?
    var isCancelled = false
    
    func executeStep() {
        guard !isCancelled else { return }
        controller?.notify(sender: self, event: .stepExecuted)
    }
}
