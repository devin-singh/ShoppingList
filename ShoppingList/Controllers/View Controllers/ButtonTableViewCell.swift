//
//  ButtonTableViewCell.swift
//  ShoppingList
//
//  Created by Devin Singh on 1/17/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
     func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    // MARK: - Properties
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
        
    //MARK: - Actions
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.buttonCellButtonTapped(self)
        }
       
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        }else if !isComplete{
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }

}

extension ButtonTableViewCell {
    func update(withItem item: Item) {
        primaryLabel.text = item.name
        updateButton(item.isComplete)
    }
}
