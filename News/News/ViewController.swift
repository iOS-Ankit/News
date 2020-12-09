//
//  ViewController.swift
//  News
//
//  Created by Ankit on 09/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Interface Builder Outlets
    
    @IBOutlet weak var newsListTblVw: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Interface Builder Properties
    
    var articles = [NewsList.Article]()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchNews()
    }
    
    // MARK: News API
    
    func fetchNews() {
        activityIndicator.startAnimating()
        let vm = NewsViewModel()
        vm.apiTofetchNews { (results, error)  in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
                if let newsArticles = results?.articles {
                    self.articles = newsArticles
                    self.newsListTblVw.reloadData()
                } else {
                    print(error ?? "Something went wrong")
                }
            }
        }
    }
    
    // MARK: Interface Builder Actions
    
    @IBAction func refreshList(sender: UIBarButtonItem) {
        fetchNews()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setCellData(newsInfo: self.articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
