//
//  NewsCell.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 15.03.2023.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var cellPhoto: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSource: UILabel!
    @IBOutlet weak var descrView: UIView!
    @IBOutlet weak var cellDescription: UILabel!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article: Article){
        
        articleToDisplay = article
        
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        // Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the cachemanager before downloading any image data
        if let imageData = CacheManager.retrievedData(urlString) {
            
            // There is image data, set the imageview and return
            cellPhoto.image = UIImage(data: imageData)
            
            return
        }
        
        // Create the url
        let url = URL(string: urlString)
        
        // Check that the url isn't nil
        guard url != nil else {
            print("Coudn't create the url object ")
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Create the datatask
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there no errors
            if error == nil && data != nil {
                
                // Save the date into cache
                CacheManager.saveData(urlString, data!)
                
                
                // Check if the url string that the data task went off download matches the article this cell is set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        
                        // Dispaly the image data in the image view
                        self.cellPhoto.image = UIImage(data: data!)
                        
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            
                            self.cellPhoto.alpha = 1
                            
                        }, completion: nil)
                        
                        return
                        
                    }
                }
                
                
            } // End if
        } // End data task
        
        // Kick off the datatask
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellPhoto.layer.cornerRadius = cellPhoto.frame.size.height / 25
        cellPhoto.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        descrView.layer.cornerRadius = descrView.frame.size.height / 25
        descrView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            
            self.cellTitle.alpha = 1
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            
            self.cellDescription.alpha = 1
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            
            self.cellSource.alpha = 1
            
        }, completion: nil)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
