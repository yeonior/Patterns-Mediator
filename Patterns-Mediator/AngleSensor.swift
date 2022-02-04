//
//  AngleSensor.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

final class AngleSensor: Component {
    
    var controller: Mediator?
    var value: Double = 0 {
        didSet {
            controller?.notify(sender: self, event: .angleChanged)
        }
    }
}
