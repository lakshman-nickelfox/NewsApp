//
//  ViewController.swift
//  News-App
//
//  Created by Sree Lakshman on 27/06/22.
//

import UIKit
import SafariServices


class TopRatedpage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
     var articles = [Article]()
     var viewModels = [NewsTableViewCellViewModel]()
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "NewsViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "cell")
        
        fetchTopStories()
       
    }
    
    
   
    
    
    private func fetchTopStories() {
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.viewModels = articles.compactMap({
                    NewsTableViewCellViewModel(title: $0.title ?? "No Title",
                                               subtitle: $0.description ?? "No Description",
                                               imageURL: URL(string: $0.urlToImage ?? "https://demofree.sirv.com/nope-not-here.jpg?w=150"))
                })
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsViewCell
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let article = articles[indexPath.row]
//
//        guard let url = URL(string: article.url ?? "") else {
//            return
//        }
//        let vc = SFSafariViewController(url: url)
//        present(vc,animated: true )
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NextView") as! NewsDisplaypage

                nextViewController.article = articles[indexPath.row]

        navigationController?.pushViewController(nextViewController, animated: true)
        
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

