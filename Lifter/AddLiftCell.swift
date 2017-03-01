//
//  AddLiftCell.swift
//  Lifter
//
//  Created by Keanu Interone on 2/28/17.
//  Copyright © 2017 Keanu Interone. All rights reserved.
//

import UIKit
import LBTAComponents

class AddLiftCell: UICollectionViewCell {
    
    var controller: WorkoutViewController? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let addLiftButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addLift), for: .touchUpInside)
        button.backgroundColor = .blue
        button.setTitle("Add Lift", for: .normal)
        return button
    }()
    
    func addLift() {
        controller?.addLift()
    }
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(addLiftButton)
        
        addLiftButton.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
