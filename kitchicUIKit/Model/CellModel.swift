//
//  CellModel.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 21.08.2022.
//

import Foundation
import UIKit


class CellModel: UITableViewCell {
    
    let cellView: UIView = {
    
    let view = UIView()
    view.backgroundColor = UIColor.red
    view.layer.cornerRadius = 10
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
            }()
    
}

struct NewsCellModel {
    
    var title: String
    var published: String
    var image: String
    var source: String
    
}
