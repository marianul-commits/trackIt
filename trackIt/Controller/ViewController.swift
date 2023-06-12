//
//  ViewController.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 09.08.2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate {
    
    @IBOutlet weak var searchNews: UITextField!
    @IBOutlet weak var newsTable: UITableView!
    
    
    let cellSpacingHeight: CGFloat = 5
    var model = ArticleModel()
    var articles = [Article]()
    var searchText = ""
    let categories = ["Home", "Tech", "Science", "Health", "Sport", "General", "Pastime", "Business"]
    var collectionView: UICollectionView!
    var selectedButtonIndex: Int = 0
    
    let refreshControl = UIRefreshControl()
    
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
        
        
        // Header + Label + Pull to refresh
        newsTable.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        
    }
    
    @objc func refresh(_ sender: AnyObject){
        model.getArticles()
        newsTable.reloadData()
        refreshControl.endRefreshing()
    }
    
}
// Creating extensions for Delegates & clean code


extension ViewController: UITextFieldDelegate{
    
    func reloadData(){
        self.newsTable.reloadData()
        Values.searchItem = ""
    }
    
    
    @IBAction func searchPressed(_ sender: Any) {
        var searchText = searchNews.text?.lowercased()
        Values.searchItem = searchText?.replacingOccurrences(of: " ", with: "%") ?? ""
        model.getSearch()
        reloadData()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var searchText = searchNews.text?.lowercased()
        Values.searchItem = searchText?.replacingOccurrences(of: " ", with: "%") ?? ""
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
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        openURL(indexPath.row)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! NewsCell
        
        let article = articles[indexPath.row]
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.cellTitle.text = articles[indexPath.row].title
        cell.cellSource.text = articles[indexPath.row].source.name
        cell.cellDescription.text = articles[indexPath.row].description
        cell.displayArticle(article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 120))
        headerView.backgroundColor = UIColor(named: "Background")
        
        let stackView = UIStackView(frame: CGRect(x: 16, y: 16, width: tableView.frame.width - 32, height: 88))
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        let label = PaddingLabel(frame: CGRect(x: 0, y: 0, width: stackView.frame.width, height: 30))
        label.topInset = 5.0 //by default
        label.bottomInset = 5.0 //by default
        label.leftInset = 7.0 //by default
        label.rightInset = 7.0 //by default
        label.text = "Top Stories"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(named: "TitleCol")
        label.textAlignment = .left
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: 85, height: 30)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: stackView.frame.width+20, height: 55), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(named: "Background")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(collectionView)
        headerView.addSubview(stackView)
        
        return headerView
    }
    
}


extension ViewController: UICollectionViewDataSource{
    // MARK: - UICollectionViewDataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath)
        cell.backgroundColor = UIColor(named: "Background")
        
        let button = UIButton()
        button.setTitle(categories[indexPath.item], for: .normal)
        button.setTitleColor(UIColor(named: "TitleCol"), for: .normal)
        
        let titleWidth = button.titleLabel?.intrinsicContentSize.width ?? 0
        
        button.frame = CGRect(x: 0, y: 0, width: 85, height: 27)
        button.frame.inset(by: .init(top: 5, left: 10, bottom: 5, right: 10))
        button.layer.cornerRadius = button.frame.height / 2

        let isSelected = indexPath.item == selectedButtonIndex
            
        button.backgroundColor = isSelected ? UIColor(named: "SelectedBtnBkg") : UIColor(named: "BtnBkg")
                    
        button.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)
        
        cell.contentView.addSubview(button)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate Methods
    
    @objc func categoryTapped(_ sender: UIButton) {

        if let title = sender.currentTitle {
            switch title {
            case "Home":
                model.getArticles()
                self.newsTable.reloadData()
            case "Tech":
                model.getTech()
                self.newsTable.reloadData()
            case "Science":
                model.getScience()
                self.newsTable.reloadData()
            case "Health":
                model.getHealth()
                self.newsTable.reloadData()
            case "Sport":
                model.getSport()
                self.newsTable.reloadData()
            case "General":
                model.getGeneral()
                self.newsTable.reloadData()
            case "Pastime":
                model.getEntertainment()
                self.newsTable.reloadData()
            case "Business":
                model.getBusiness()
                self.newsTable.reloadData()
            default:
                model.getArticles()
                self.newsTable.reloadData()
            }
            
            // Get the index of the selected button
            if let index = categories.firstIndex(of: title) {
                selectedButtonIndex = index
            }
            
            // Reload the collection view to update button appearance
            collectionView.reloadData()
            
            
        }
        
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
