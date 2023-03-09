//
//  LauncScreenView.swift
//  Country
//
//  Created by m223 on 09.03.2023.
//

import UIKit

class LaunchScreenView: ViewController{
    
    let launchIconImageView = UIImageView()
    
    let launchTextLabel = UILabel()
    
    let progressView = UIProgressView()
    
    let progress = Progress(totalUnitCount: 11)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        settingsLaunchScreenIcon()
        settingsProgressView()
        settingsLaunchScreenNameLabel()
        
        
    }
    
    func settingsLaunchScreenIcon(){
        
        view.addSubview(launchIconImageView)
        
        let sizeOfIcon = view.frame.width / 100 * 50
        
        launchIconImageView.image = UIImage(named: "icon")
        launchIconImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            launchIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchIconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            launchIconImageView.widthAnchor.constraint(equalToConstant: sizeOfIcon),
            launchIconImageView.heightAnchor.constraint(equalToConstant: sizeOfIcon)
        
        ])
    }
    
    func settingsLaunchScreenNameLabel(){
        
        view.addSubview(launchTextLabel)
        
        launchTextLabel.text = "Welcome to Countries"
        launchTextLabel.font = UIFont.systemFont(ofSize: 28)
        launchTextLabel.textAlignment = .center
        launchTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            launchTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchTextLabel.heightAnchor.constraint(equalToConstant: 20),
            launchTextLabel.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func settingsProgressView(){
        
        view.addSubview(progressView)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.1
        progressView.progressTintColor = .red
        progressView.trackTintColor = .blue
        progressView.observedProgress = progress
        
        progress.cancellationHandler = {
            print("progress was stopped")
        }
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            progressView.widthAnchor.constraint(equalToConstant: 300)
            
        ])
        
        //Settings timer for progressView
        
        var count = countryArrayAPI.count
        
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true){ timer in
                if self.progress.isCancelled {
                    timer.invalidate()
                }
                
                if self.progress.fractionCompleted == 1{
                    self.progress.cancel()
                }
                
                self.progress.completedUnitCount = Int64(count)
                count += 1
            }
    }
    
}
