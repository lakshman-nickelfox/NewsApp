//
//  NewsViewCell.swift
//  News-App
//
//  Created by Sree Lakshman on 28/06/22.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        newsImage.image = nil
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel){
        titleLabel.text = viewModel.title
        
        
        if let data = viewModel.imageData {
            newsImage.image = UIImage(data: data)
        }
        else if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImage.image = UIImage(data: data)
                }
            }.resume()
            
        }
        
    }
    

}

