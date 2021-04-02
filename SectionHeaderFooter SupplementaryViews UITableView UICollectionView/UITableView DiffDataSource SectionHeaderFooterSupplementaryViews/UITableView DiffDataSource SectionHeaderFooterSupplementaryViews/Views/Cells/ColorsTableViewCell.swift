//
//  ColorsTableViewCell.swift
//  UITableView DiffDataSource SectionHeaderFooterSupplementaryViews
//
//  Created by Jason Pinlac on 3/30/21.
//

import UIKit

class ColorsTableViewCell: UITableViewCell {
    static let reuseId: String = String(describing: ColorsTableViewCell.self)

    @IBOutlet var label: UILabel!
    
    func set(color: Color) {
        self.contentView.backgroundColor = color.bgColor
        label.text = color.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
