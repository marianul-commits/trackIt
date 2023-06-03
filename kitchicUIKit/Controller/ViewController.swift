//
//  ViewController.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 09.08.2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var searchNews: UITextField!
    @IBOutlet weak var newsTable: UITableView!
    
    
    let cellSpacingHeight: CGFloat = 5
    
//    private var viewModels = [NewsTableCellViewModel]()
//    private var articles = [NewsModel]()
    
    var model = ArticleModel()
    var articles = [Article]()
    var n = 0
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making a clear background for the Table View

        newsTable.dataSource = self
        newsTable.delegate = self
        newsTable.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        newsTable.backgroundColor = UIColor.clear
        newsTable.layer.backgroundColor = UIColor.clear.cgColor
        searchNews.delegate = self
        model.delegate = self
        model.getArticles()
        
    }
    
    
}
// Creating extensions for Delegates & clean code


extension ViewController: UITextFieldDelegate{
    
    func reloadData(){
        self.newsTable.reloadData()
        Values.searchItem = ""
        self.searchNews.text = ""
    }
    
    
    @IBAction func searchPressed(_ sender: Any) {
        searchNews.endEditing(true)
        var searchText = searchNews.text?.lowercased()
        Values.searchItem = searchText?.replacingOccurrences(of: " ", with: "_") ?? ""
        model.getSearch()
        reloadData()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var searchText = searchNews.text?.lowercased()
        Values.searchItem = searchText?.replacingOccurrences(of: " ", with: "_") ?? ""
        model.getSearch()
        searchNews.resignFirstResponder()
        reloadData()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searchNews.text = ""
    }
    
    //Checking if the user ended his search querry
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // Checking if the search field is not empty so no null search is done
        
        if searchNews.text != "" {
            return true
        } else {
            searchNews.placeholder = "Search news"
            return false
        }
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //Clearing the text field after searching
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Get a hold of the user search querry
        
        searchNews.text = ""
    }

}


extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsTable.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
                
        func openURL(_ urlString: Int) {
            guard let url = URL(string: article.url ?? "www.google.com") else {
                // not a valid URL
                return
            }

            if ["http", "https"].contains(url.scheme?.lowercased() ?? "") {
                // Can open with SFSafariViewController
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let safariViewController = SFSafariViewController(url: url, configuration: config)
                self.present(safariViewController, animated: true)
            } else {
                // Scheme is not supported or no scheme is given, use openURL
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        openURL(indexPath.row)
        
        
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! NewsCell
//        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        let article = articles[indexPath.row]
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.cellTitle.text = articles[indexPath.row].title
        cell.cellSource.text = articles[indexPath.row].source.name
        cell.cellDescription.text = articles[indexPath.row].description
        cell.displayArticle(article)
        return cell
    }
}


extension ViewController:  ArticleModernProtocol{
    
    //MARK: - Article Model Protocol Methods
    
    func articleRetrived(_ article: [Article]) {
        
        // Set the articles property of the view controller to the articless passed back from the model
        self.articles = article
        
        // Refresh the tableview
        newsTable.reloadData()
    }
    
}
