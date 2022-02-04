//
//  CentralController.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 04.02.2022.
//

import Foundation

final class CentralController: Mediator {
    
    var pitchAngleSensor: AngleSensor
    var rotateAngleSensor: AngleSensor
    var healingAngleSensor: AngleSensor
    
    var bodyStabilizer: BodyStabilizer
    var movementRegulator: MovementRegulator
    var systemLogger: SystemLogger
    
    init(pitchAngleSensor: AngleSensor,
         rotateAngleSensor: AngleSensor,
         healingAngleSensor: AngleSensor,
         bodyStabilizer: BodyStabilizer,
         movementRegulator: MovementRegulator,
         systemLogger: SystemLogger) {
        self.pitchAngleSensor = pitchAngleSensor
        self.rotateAngleSensor = rotateAngleSensor
        self.healingAngleSensor = healingAngleSensor
        self.bodyStabilizer = bodyStabilizer
        self.movementRegulator = movementRegulator
        self.systemLogger = systemLogger
    }
    
    func notify(sender: Component, event: Event) {
        switch event {
        case .stepExecuted:
            pitchAngleSensor.value = Double(arc4random_uniform(10))
        case .angleChanged:
            let pitchValue = pitchAngleSensor.value
            systemLogger.log(pitch: pitchValue)
            guard pitchValue > 3 else {
                print("Stabilization is not needed!")
                return
            }
            bodyStabilizer.stabilize()
        case .stabilizationFinished:
            break
        }
    }
    
    func goForward(steps: Int) {
        var i = 1
        while i <= steps && !movementRegulator.isCancelled {
            print("\(i) steps forward")
            movementRegulator.executeStep()
            i += 1
        }
    }
}
