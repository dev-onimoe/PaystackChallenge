//
//  DetailViewController.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 05/07/2024.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var image: UIImageView = UIImageView()
    var stack: UIStackView = UIStackView()
    var repoName: UILabel = UILabel()
    
    var repo: APIRepo? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        
        self.view.backgroundColor = .systemBackground
        
        let vv = UIView()
        //vv.backgroundColor = .red
        self.view.addSubview(vv)
        vv.clipsToBounds = true
        vv.constraint(equalToTop: self.view.topAnchor, paddingTop: 24, width: 120, height: 120)
        vv.layer.cornerRadius = 60
        vv.centre(centerX: self.view.centerXAnchor)
        
        //image.image = UIImage(systemName: "photo")
        vv.addSubview(image)
        //image.alpha = 0
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.constraint(equalToTop: vv.topAnchor, paddingTop: 0, width: 120, height: 120)
        image.layer.cornerRadius = 60
        image.centre(centerX: vv.centerXAnchor)
        
        self.view.addSubview(repoName)
        repoName.constraint(equalToTop: vv.bottomAnchor, equalToLeft: self.view.leadingAnchor, equalToRight: view.trailingAnchor, paddingTop: 12, paddingLeft: 16, paddingRight: 16)
        repoName.numberOfLines = 2
        repoName.textColor = .label
        repoName.textAlignment = .center
        
        self.view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 10
        stack.constraint(equalToTop: repoName.bottomAnchor, equalToLeft: view.leadingAnchor, equalToRight: view.trailingAnchor, paddingTop: 16, paddingLeft: 12, paddingRight: 12)
        
        if let repo = repo {
            image.layer.masksToBounds = true
            image.layer.cornerRadius = image.frame.height / 2
            image.tintColor = UIColor.black.withAlphaComponent(0.3)
            image.sd_setImage(with: URL(string: repo.owner.avatar), placeholderImage: UIImage(systemName: "photo"))
            repoName.text = repo.name
            populateFields(key: "id", value: String(repo.id))
            populateFields(key: "name", value: String(repo.name))
            
            if let desc = repo.descriptions {
                populateFields(key: "Description", value: desc)
            }
            populateFields(key: "url", value: repo.url)
        }
    }
    
    func populateFields(key: String, value: String) {
        
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        
        
        let title = UILabel()
        title.text = key.uppercased()
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .label
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "detailTextColor")
        view.layer.cornerRadius = 12
        
        let valueText = UILabel()
        valueText.text = value
        valueText.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 12)
        valueText.textColor = .label //valuebg
        view.addSubview(valueText)
        valueText.constraint(equalToTop: view.topAnchor, equalToBottom: view.bottomAnchor, equalToLeft: view.leadingAnchor, equalToRight: view.trailingAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 12, paddingRight: 12)
        
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(view)
        
        self.stack.addArrangedSubview(stack)
    }

}
