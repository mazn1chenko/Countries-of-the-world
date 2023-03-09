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
        
        
        backgroundColor = .lightGray
        setup()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        flag.translatesAutoresizingMaskIntoConstraints = false
        flag.image = UIImage(named: "*flag*")
        flag.layer.borderWidth = 1
        flag.layer.masksToBounds = false
        flag.layer.borderColor = UIColor.black.cgColor
        flag.layer.cornerRadius = 25
        flag.clipsToBounds = true
        
        nameOfCountry.text = "*countryName*"
        nameOfCountry.font = UIFont(name: "Inter-Regular", size: 18)
        nameOfCountry.adjustsFontSizeToFitWidth = true
        nameOfCountry.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(flag)

        addSubview(nameOfCountry)
        
        NSLayoutConstraint.activate([nameOfCountry.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                                     nameOfCountry.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     nameOfCountry.heightAnchor.constraint(equalToConstant: 25),
                                     nameOfCountry.widthAnchor.constraint(equalToConstant: 150)
        
        ])
        
        NSLayoutConstraint.activate([flag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     flag.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     flag.heightAnchor.constraint(equalToConstant: 50),
                                     flag.widthAnchor.constraint(equalToConstant: 50)

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
