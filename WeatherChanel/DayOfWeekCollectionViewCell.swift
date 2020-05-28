//
//  DayOfWeekCollectionViewCell.swift
//  WeatherChanel
//
//  Created by Nam Le on 5/28/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class DayOfWeekCollectionViewCell: UICollectionViewCell {
    // tao cell
    let containerView1: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let weekDayLB: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let weatherImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let maxMinTempLB: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var weather1: Weather1? {
        didSet {
            if let weather = weather1 {
                weekDayLB.text = weather.weekDay
                weatherImg.image = UIImage(named: weather.weatherImg)
                maxMinTempLB.text = weather.maxMinTemp
                print("ahihi")
            }
        }
    }
    
    func setupLayout() {
        addSubview(containerView1)
        containerView1.addSubview(weekDayLB)
        containerView1.addSubview(weatherImg)
        containerView1.addSubview(maxMinTempLB)
        
        containerView1.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        containerView1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
        containerView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4).isActive = true
        containerView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        
        weekDayLB.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor, constant: 12).isActive = true
        weekDayLB.centerYAnchor.constraint(equalTo: containerView1.centerYAnchor).isActive = true
        weekDayLB.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        weatherImg.centerXAnchor.constraint(equalTo: containerView1.centerXAnchor).isActive = true
        weatherImg.centerYAnchor.constraint(equalTo: containerView1.centerYAnchor).isActive = true
        weatherImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        maxMinTempLB.trailingAnchor.constraint(equalTo: containerView1.trailingAnchor, constant: 68).isActive = true
        maxMinTempLB.centerYAnchor.constraint(equalTo: containerView1.centerYAnchor).isActive = true
        maxMinTempLB.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
}
