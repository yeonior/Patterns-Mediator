//
//  Mediator.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

enum Event {
    case stepExecuted
    case angleChanged
    case stabilizationFinished
}

protocol Mediator {
    func notify(sender: Component, event: Event)
}

protocol Component {
    var controller: Mediator? { get set }
}
