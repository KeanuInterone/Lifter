//
//  WorkoutViewController.swift
//  Lifter
//
//  Created by Keanu Interone on 2/22/17.
//  Copyright © 2017 Keanu Interone. All rights reserved.
//

import UIKit
import LBTAComponents

let backgroundColor = UIColor(r: 43, g: 60, b: 90, a: 100)
let liftCellColor = UIColor(r: 95, g: 233, b: 59, a: 100)


class WorkoutViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let liftCellID = "liftCellID"
    let addLiftCellID = "addLiftCellID"
    
    
    // DATA
    var workout = Workout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = backgroundColor
        collectionView?.register(LiftCell.self, forCellWithReuseIdentifier: liftCellID)
        collectionView?.register(AddLiftCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: addLiftCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workout.getLifts().count
    }

    
    // MAKES THE FOOTER CELL
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: addLiftCellID, for: indexPath)
        return footer
    }
    
    // SIZE FOR FOOTER CELL
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 50)
    }
    
    // MAKES THE CELLS
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // CREATE A CELL
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: liftCellID, for: indexPath) as! LiftCell
        
        // SET UP THE CELL
        cell.setUpCell(cellID: indexPath.row, controller: self)
        
        // ADD ATRIBUTES
        let lift = workout.getLifts()[indexPath.row]
        cell.nameLabel.text = lift.liftName
        cell.weightTextBox.text = lift.weight
        cell.setsTextBox.text = lift.sets
        cell.repsTextBox.text = lift.reps
        
        return cell
    }
    
    // SIZE FOR THE CELLS
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 20, height: 150)
    }
    
    // INSTETS FOR THE CELLS
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    func addLift() {
        saveCells()
        workout.addLift(name: "", weight: "", sets: "", reps: "")
        collectionView?.reloadData()
    }
    
    func updateLift(cellID: Int, name: String, weight: String, sets: String, reps: String) {
        workout.updateLiftAt(index: cellID, name: name, weight: weight, sets: sets, reps: reps)
        collectionView?.reloadData()
    }
    
    func saveCells() {

        for cell in (collectionView?.visibleCells)! {
            let cell = cell as! LiftCell
            cell.saveCell()
        }

    }
}























