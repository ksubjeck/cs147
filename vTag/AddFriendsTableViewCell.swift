//
//  AddFriendsTableViewCell.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

protocol AddFriendsTableViewCellDelegate : class {
    func didPressButton(_ sender: UIButton?, buttonLabel: UILabel, nameLabel: UILabel)
}

class AddFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    weak var cellDelegate: AddFriendsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addFriend(_ sender: UIButton) {
        let buttonLabel = self.buttonLabel
        cellDelegate?.didPressButton(sender, buttonLabel: buttonLabel!, nameLabel: nameLabel!)
    }
}
