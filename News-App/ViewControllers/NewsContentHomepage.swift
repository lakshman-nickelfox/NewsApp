//
//  NewsContentHomepage.swift
//  News-App
//
//  Created by Sree Lakshman on 28/06/22.
//

import UIKit

class NewsContentHomepage: UIViewController {
    
    
      
    var articles = [Article]()
    var viewModels = [NewsTableViewCellViewModel]()
    
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var headlineTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //fetchTopStories()
        
    }
    
//    private func fetchTopStories() {
//        APICaller.shared.getTopStories { [weak self] result in
//            switch result {
//            case .success(let articles):
//                self?.articles = articles
//                self?.viewModels = articles.compactMap({
//                    NewsTableViewCellViewModel(title: $0.title ?? "No Title",
//                                               subtitle: $0.description ?? "No Description",
//                                               imageURL: URL(string: $0.urlToImage ?? "https://demofree.sirv.com/nope-not-here.jpg?w=150"))
//                })
//                DispatchQueue.main.async {
//                    //self?.NewsContentHomepage.reloadData()
//
//                }
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//    }
}
    
    
    
   
