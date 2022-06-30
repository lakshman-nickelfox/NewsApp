//
//  NewsDisplaypage.swift
//  News-App
//
//  Created by Sree Lakshman on 30/06/22.
//

import UIKit

class NewsDisplaypage: UIViewController {
    
    
    var article : Article? = Article(title: "", description: "", url: "", urlToImage: "")
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headlineLabel.text = article?.title
        self.descriptionLabel.text = article?.description
        if article?.urlToImage != nil
        {
            let url = URL (string: article?.urlToImage ?? "")
            newsImageView.downloadImage(from: url!)
            newsImageView.contentMode = .scaleAspectFill
        }
        else{
            newsImageView.image = UIImage(named: "emptyImage")
        }

    }
    
}
    extension UIImageView {
        
        func downloadImage (from url:URL)
        {
            contentMode = .scaleAspectFill
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error)in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let data = data, error == nil ,
                      let image = UIImage(data: data)
                else{
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
            })
            dataTask.resume()
            
        }
    }


