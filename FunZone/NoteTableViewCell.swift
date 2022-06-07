//
//  NoteTableViewCell.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-05.
//

import UIKit


class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var cell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code  9
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
