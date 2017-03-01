//
//  LiftCell.swift
//  Lifter
//
//  Created by Keanu Interone on 2/28/17.
//  Copyright © 2017 Keanu Interone. All rights reserved.
//

import UIKit
import LBTAComponents

class LiftCell: UICollectionViewCell {
    
    private var cellID: Int
    private var controller: WorkoutViewController
    
    override init(frame: CGRect) {
        self.cellID = 0
        self.controller = WorkoutViewController()
        
        super.init(frame: frame)
        
        nameLabel.addTarget(self, action: #selector(doneEditing), for: .editingDidEndOnExit)
        
        setUpViews()
    }
    
    func setUpCell(cellID: Int, controller: WorkoutViewController) {
        self.cellID = cellID
        self.controller = controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TOUCH CELL TO STOP EDITING
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveCell()
        endEditing(true)
    }
    
    func doneEditing() {
        saveCell()
        endEditing(true)
    }
    
    func saveCell() {
        controller.updateLift(cellID: cellID, name: nameLabel.text!, weight: weightTextBox.text!, sets: setsTextBox.text!, reps: repsTextBox.text!)
    }
    
    let nameLabel: UITextField = {
        let textBox = UITextField()
        textBox.returnKeyType = .done
        textBox.font = UIFont(descriptor: (textBox.font?.fontDescriptor)!, size: 50)
        textBox.backgroundColor = .clear
        textBox.placeholder = "Name"
        return textBox
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let xLabel: UILabel = {
        let x = UILabel()
        x.text = "X"
        x.font = UIFont.systemFont(ofSize: 25)
        return x
    }()
    
    let weightTextBox: UITextField = {
        let textBox = UITextField()
        textBox.borderStyle = .roundedRect
        textBox.font = UIFont(descriptor: (textBox.font?.fontDescriptor)!, size: 50)
        textBox.keyboardType = .decimalPad
        textBox.backgroundColor = .white
        return textBox
    }()
    
    let setsTextBox: UITextField = {
        let textBox = UITextField()
        textBox.borderStyle = .roundedRect
        textBox.font = UIFont(descriptor: (textBox.font?.fontDescriptor)!, size: 50)
        textBox.keyboardType = .decimalPad
        textBox.backgroundColor = .white
        return textBox
    }()
    
    let repsTextBox: UITextField = {
        let textBox = UITextField()
        textBox.borderStyle = .roundedRect
        textBox.font = UIFont(descriptor: (textBox.font?.fontDescriptor)!, size: 50)
        textBox.keyboardType = .decimalPad
        textBox.backgroundColor = .white
        return textBox
    }()
    
    
    private func setUpViews() {
        backgroundColor = liftCellColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        addSubview(nameLabel)
        addSubview(weightLabel)
        addSubview(setsLabel)
        addSubview(xLabel)
        addSubview(repsLabel)
        addSubview(weightTextBox)
        addSubview(setsTextBox)
        addSubview(repsTextBox)
        
        
        let padding: CGFloat = 20
        let fieldWidth = frame.width / 3 - padding
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: frame.height * 3 / 10)
        
        // MASTER ANCHOR
        weightLabel.anchor(nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: padding / 2, bottomConstant: 0, rightConstant: 0, widthConstant: fieldWidth, heightConstant: frame.height * 2 / 10)
        
        setsLabel.anchor(weightLabel.topAnchor, left: weightLabel.rightAnchor, bottom: weightLabel.bottomAnchor, right: nil, topConstant: 0, leftConstant: padding, bottomConstant: 0, rightConstant: 0, widthConstant: fieldWidth, heightConstant: 0)
        
        repsLabel.anchor(weightLabel.topAnchor, left: setsLabel.rightAnchor, bottom: weightLabel.bottomAnchor, right: nil, topConstant: 0, leftConstant: padding, bottomConstant: 0, rightConstant: 0, widthConstant: fieldWidth, heightConstant: 0)
        
        // MASTER ANCHOR
        weightTextBox.anchor(weightLabel.bottomAnchor, left: weightLabel.leftAnchor, bottom: bottomAnchor, right: weightLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setsTextBox.anchor(setsLabel.bottomAnchor, left: setsLabel.leftAnchor, bottom: weightTextBox.bottomAnchor, right: setsLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        repsTextBox.anchor(repsLabel.bottomAnchor, left: repsLabel.leftAnchor, bottom: weightTextBox.bottomAnchor, right: repsLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        xLabel.anchor(setsLabel.bottomAnchor, left: setsTextBox.rightAnchor, bottom: setsTextBox.bottomAnchor, right: repsTextBox.leftAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}
