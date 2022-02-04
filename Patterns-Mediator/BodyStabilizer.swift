//
//  BodyStabilizer.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

final class BodyStabilizer: Component {
    
    var controller: Mediator?
    
    func stabilize() {
        print("Stabilizing body...\n")
        controller?.notify(sender: self, event: .stabilizationFinished)
    }
}
