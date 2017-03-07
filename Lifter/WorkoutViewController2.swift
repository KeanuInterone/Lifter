//
//  WorkoutViewController2.swift
//  Lifter
//
//  Created by Keanu Interone on 3/1/17.
//  Copyright © 2017 Keanu Interone. All rights reserved.
//

import UIKit
import LBTAComponents

class WorkoutViewController2: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let liftCell2ID = "LiftCell2ID"
    var expandedCellIndex = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = backgroundColor
        
        collectionView?.register(LiftCell2.self, forCellWithReuseIdentifier: liftCell2ID)
    }
    
    
    // Number of lift cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // Make the lift cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: liftCell2ID, for: indexPath) as! LiftCell2
        cell.setUpCell(controller: self)
        return cell
    }
    
    // Size for lift cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (indexPath == expandedCellIndex) {
            return CGSize(width: view.frame.width, height: 100)
        }
        else  {
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    
    func expandCell(cell: UICollectionViewCell) {
        print("expanding button")
        expandedCellIndex = (collectionView?.indexPath(for: cell))!
        collectionView?.reloadItems(at: [expandedCellIndex])
    }

    
}


class LiftCell2: UICollectionViewCell {
    
    var controller: WorkoutViewController2
    
    override init(frame: CGRect) {
        controller = WorkoutViewController2()
        super.init(frame: frame)
        self.backgroundColor = .white
        
        button.addTarget(self, action: #selector(expandCell), for: .touchUpInside)
        
        setUpViews()
    }
    
    func expandCell() {
        controller.expandCell(cell: self)
    }
    
    func setUpCell(controller: WorkoutViewController2) {
        self.controller = controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    func setUpViews() {
        
        addSubview(button)
        button.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 0)
    }
    
    
    
}
