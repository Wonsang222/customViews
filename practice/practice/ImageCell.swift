//
//  ImageCell.swift
//  practice
//
//  Created by Wonsang Hwang on 2/18/25.
//

import UIKit

class TableImageCell: UITableViewCell {

    @IBOutlet weak var leftIamgeView: UIImageView! {
        didSet {
            leftIamgeView.contentMode = .scaleAspectFill
            
        }
    }
    @IBOutlet weak var middleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
