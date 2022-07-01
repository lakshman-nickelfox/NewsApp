//
//  NewsDisplaypage.swift
//  News-App
//
//  Created by Sree Lakshman on 30/06/22.
//

import UIKit
import SafariServices

class NewsDisplaypage: UIViewController {
    
    
    var article : Article? = Article(title: "", description: "", url: "", urlToImage: "")
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceButton: UIButton!
    
    
    //Button action for Displaying the source Article via url
    @IBAction func buttonAction (_ sender: UIButton) {
        guard let url = URL(string: article?.url ?? "") else {
            return
        }
        let vc = SFSafariViewController(url: url)
            present(vc,animated: true )
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Passing Headline, Description and Image to article
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
            newsImageView.contentMode = .scaleAspectFill
        }

    }
    
}
    extension UIImageView {
        //function to download image from an API using URLSession
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


