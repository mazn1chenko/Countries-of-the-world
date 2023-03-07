//
//  CountryTableViewCell.swift
//  Country
//
//  Created by m223 on 22.02.2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    static let reuseID = "CountryCell"
    
    let flag = UIImageView()
    
    let nameOfCountry = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        flag.translatesAutoresizingMaskIntoConstraints = false
        flag.image = UIImage(named: "BTC")
        
        nameOfCountry.text = "LOL"
        nameOfCountry.font = UIFont.systemFont(ofSize: 14)
        nameOfCountry.adjustsFontSizeToFitWidth = true
    }
    
    func layout() {
        addSubview(flag)
        addSubview(nameOfCountry)
        
        
        nameOfCountry.frame = CGRectMake(90.0, 25.0, 100.0, 30.0)
        
        NSLayoutConstraint.activate([flag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     flag.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     flag.heightAnchor.constraint(equalToConstant: 50),
                                     flag.widthAnchor.constraint(equalToConstant: 50),

                                    ])
        
    }
    
    func configureCell(model: CountryElement) {
        nameOfCountry.text = model.name?.common
        if let imageAPI = model.flags?.png {
            let API = imageAPI
            guard let apiURL = URL(string: API) else {
                fatalError("Someting with URL image")
            }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: apiURL) {(data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.flag.image = UIImage(data: data)
                }
            }
                task.resume()
        }

    }
   
}
