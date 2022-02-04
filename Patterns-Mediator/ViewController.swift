//
//  ViewController.swift
//  Patterns-Mediator
//
//  Created by Ruslan on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pitchAngleSensor = AngleSensor()
        let rotateAngleSensor = AngleSensor()
        let healingAngleSensor = AngleSensor()
        let bodyStabilizer = BodyStabilizer()
        let movementRegulator = MovementRegulator()
        let systemLogger = SystemLogger()
        
        let controller = CentralController(pitchAngleSensor: pitchAngleSensor,
                                           rotateAngleSensor: rotateAngleSensor,
                                           healingAngleSensor: healingAngleSensor,
                                           bodyStabilizer: bodyStabilizer,
                                           movementRegulator: movementRegulator,
                                           systemLogger: systemLogger)
        
        pitchAngleSensor.controller = controller
        rotateAngleSensor.controller = controller
        healingAngleSensor.controller = controller
        bodyStabilizer.controller = controller
        movementRegulator.controller = controller
        systemLogger.controller = controller
        
        controller.goForward(steps: 5)
    }
}

