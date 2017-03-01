//
//  Workout.swift
//  Lifter
//
//  Created by Keanu Interone on 2/28/17.
//  Copyright © 2017 Keanu Interone. All rights reserved.
//

import Foundation


class Workout {
    
    private var lifts = [Lift]()
    
    func getLifts() -> [Lift] {
        return lifts
    }
    
    func addLift(name: String, weight: String, sets: String, reps: String) {
        let lift = Lift(liftName: name, weight: weight, sets: sets, reps: reps)
        lifts.append(lift)
    }
    
    func updateLiftAt(index: Int, name: String, weight: String, sets: String, reps: String) {
        let lift = Lift(liftName: name, weight: weight, sets: sets, reps: reps)
        lifts[index] = lift
    }
    
}
