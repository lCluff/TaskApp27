//
//  ButtonTableViewCell.swift
//  TaskApp27
//
//  Created by Leah Cluff on 6/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

@IBDesignable //Imports framework for custom cells

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var completeButton: UIButton! // IBAction Button Tapped links to same button
    @IBOutlet weak var primaryLabel: UILabel!
    
    var delegate: ButtonTableViewCellDelegate?
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete" // ternary showing if isComplete is true/not
        completeButton.setImage(UIImage(named: imageName), for: .normal)
        completeButton.layer.backgroundColor = UIColor.blue.cgColor
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) { // IBOutlet completeButton links to same button, function for button being tapped in cell
        delegate?.buttonCellButtonTapped(self)
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.addTarget(self, action: Selector(("action:")), for: UIControl.Event.touchUpInside)
        
        //then make a action method :
        
        func action(sender:UIButton!) {
            print("Button Clicked")
        }
        
    }
}
extension ButtonTableViewCell { // sets name for task in cell
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
