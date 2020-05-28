//
//  MyCollectionViewCell.swift
//  WeatherChanel
//
//  Created by Nam Le on 5/27/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let timeLB: UILabel = {
        let label = UILabel()
        label.text = "time"
        label.textColor = .white
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    let temperature: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separateView = UIView()
    var weather: Weather? {
        //khi biến weather có giá trị thì didSet dc gọi
        didSet{
            if let weather = weather {
                timeLB.text = weather.time
                weatherImage.image = UIImage(named: weather.weatherImg)
                temperature.text = weather.temp
            }
        }
    }
    
    func setupLayout() {
        // ở đây thì containerView là view cha
        addSubview(containerView)
        containerView.addSubview(timeLB)
        containerView.addSubview(weatherImage)
        containerView.addSubview(temperature)
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        
        timeLB.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        timeLB.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        timeLB.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        weatherImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        weatherImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        temperature.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        temperature.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    // khởi tạo cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
}
