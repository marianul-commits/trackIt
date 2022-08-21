//
//  NewsCell.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 21.08.2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
