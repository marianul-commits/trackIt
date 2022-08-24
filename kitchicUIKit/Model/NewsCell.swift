//
//  NewsCell.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 21.08.2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var source: UILabelPadding!
    @IBOutlet weak var desc: UILabelPadding!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabelPadding!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


// Creating the text Padding for cell UILabel

class UILabelPadding: UILabel {

    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }



}
