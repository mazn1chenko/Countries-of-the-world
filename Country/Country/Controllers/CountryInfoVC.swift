//
//  CountryInfoVC.swift
//  Country
//
//  Created by m223 on 23.02.2023.
//
import UIKit

class CountryInfoVC: UIViewController {
        
    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height)
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    
    
    var flagOfCountryImage = UIImageView()
    var nameOfCountryLabel = UILabel()
    var languageLabel = UILabel()
    var regionOfCountry = UILabel()
    var mapsButton = UIButton()
    var areaLabel = UILabel()
    var subRegionLabel = UILabel()
    var mapsText : String = ""
    var capitalLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
                
        setup()
        layout()

    }
    
    func setup() {
        
        flagOfCountryImage.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        regionOfCountry.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        subRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false

        mapsButton.translatesAutoresizingMaskIntoConstraints = false
        mapsButton.backgroundColor = .gray
        mapsButton.setTitle("Google Maps", for: .normal)
        mapsButton.contentHorizontalAlignment = .center
        mapsButton.clipsToBounds = true
        mapsButton.layer.cornerRadius = 5
        
        
        
    }

    
    func layout() {
        
        view.addSubview(flagOfCountryImage)
        view.addSubview(languageLabel)
        view.addSubview(regionOfCountry)
        view.addSubview(mapsButton)
        view.addSubview(areaLabel)
        view.addSubview(subRegionLabel)
        view.addSubview(capitalLabel)

        
        NSLayoutConstraint.activate([flagOfCountryImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     flagOfCountryImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     flagOfCountryImage.heightAnchor.constraint(equalToConstant: 160),
                                     flagOfCountryImage.widthAnchor.constraint(equalToConstant: 160)
                                    ])
                                        
        
        NSLayoutConstraint.activate([languageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 25),
                                     languageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     languageLabel.heightAnchor.constraint(equalToConstant: 25),
                                     languageLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
                                     
        NSLayoutConstraint.activate([regionOfCountry.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 50),
                                     regionOfCountry.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     regionOfCountry.heightAnchor.constraint(equalToConstant: 25),
                                     regionOfCountry.widthAnchor.constraint(equalToConstant: 250)
                                    ])
        

        
        NSLayoutConstraint.activate([areaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 75),
                                     areaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     areaLabel.heightAnchor.constraint(equalToConstant: 25),
                                     areaLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
        
        
        NSLayoutConstraint.activate([subRegionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 100),
                                     subRegionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     subRegionLabel.heightAnchor.constraint(equalToConstant: 25),
                                     subRegionLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
        
        
        
        NSLayoutConstraint.activate([capitalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 125),
                                     capitalLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     capitalLabel.heightAnchor.constraint(equalToConstant: 25),
                                     capitalLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
        
        
        
        NSLayoutConstraint.activate([mapsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160 + 150),
                                     mapsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
                                     mapsButton.heightAnchor.constraint(equalToConstant: 25),
                                     mapsButton.widthAnchor.constraint(equalToConstant: 120)
                                    ])
        mapsButton.addTarget(self, action: #selector(mapsLocation), for: .touchUpInside)
        
    }
    
    @objc func mapsLocation(action : UIButton){
        if let url = URL(string: mapsText) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    func setCountryInfo(name: String, imageOfCountry: String?, mapsLocation: String, language: [String: String], region: String, area: Double, subRegion: String, capital: [String]){
      
        nameOfCountryLabel.text = name
        navigationItem.title = name
        for(_, value) in language{
            languageLabel.text = "Language: \(value)"
        }
        regionOfCountry.text = "Region: \(region)"
        mapsText = mapsLocation
        areaLabel.text = "Area: \(area) km2"
        subRegionLabel.text = "Sub Region: \(subRegion)"
        let cap = capital.first
        capitalLabel.text = "Capital: \(cap!)"
        
        if let imageAPI = imageOfCountry {
            let API = imageAPI
            guard let apiURL = URL(string: API) else {
                fatalError("Someting with URL image")
            }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: apiURL) {(data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.flagOfCountryImage.image = UIImage(data: data)
                }
            }
                task.resume()
        }
        
        
    }
}
