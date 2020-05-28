//
//  ViewController.swift
//  WeatherChanel
//
//  Created by Nam Le on 5/27/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // tạo collectionView 1
    let collectionView: UICollectionView = {
        //khởi tạo collectionVIewLayout
        let layout = UICollectionViewFlowLayout()
        
        //khoi tao collectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        //tắt phụ thuộc control vào frame, nếu k autolayout sẽ k có tác dụng
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // đăng ký cell với collectionView
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        //đổ màu
        collectionView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        
        
        return collectionView
    }()
    let collectionView1: UICollectionView = {
        //khởi tạo collectionVIewLayout
        let layout = UICollectionViewFlowLayout()
        
        //khoi tao collectionView
        let collectionView1 = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        //tắt phụ thuộc control vào frame, nếu k autolayout sẽ k có tác dụng
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        
        // đăng ký cell với collectionView
        collectionView1.register(DayOfWeekCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        
        //đổ màu
        collectionView1.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        
        return collectionView1
    }()
    var weathers = [Weather]()
    var weathers1 = [Weather1]()
    // tạo topview
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        return view
    }()
    let placeLB: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Ha noi"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(28)
        return label
    }()
    let weatherLB: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "cloudy"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tempLB: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "42º"
        label.font = label.font.withSize(64)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let separateView = UIView()
    let separateView1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView1.delegate = self
        collectionView1.dataSource = self
        setupLayout()
        setupData()
        // thay đổi hướng scroll của collectionView
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        if let flowLayout = collectionView1.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }
    
    func setupLayout() {
        view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        topView.addSubview(placeLB)
        placeLB.topAnchor.constraint(equalTo: topView.topAnchor, constant: 40).isActive = true
        placeLB.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        placeLB.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topView.addSubview(weatherLB)
        weatherLB.topAnchor.constraint(equalTo: placeLB.bottomAnchor, constant: 15).isActive = true
        weatherLB.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        weatherLB.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topView.addSubview(tempLB)
        tempLB.topAnchor.constraint(equalTo: weatherLB.bottomAnchor, constant: 15).isActive = true
        tempLB.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        tempLB.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        topView.addSubview(separateView)
        separateView.backgroundColor = UIColor.white
        separateView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1/1).isActive = true
        separateView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separateView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 1).isActive = true
        separateView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true
        
        view.addSubview(separateView1)
        separateView1.backgroundColor = UIColor.white
        separateView1.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1/1).isActive = true
        separateView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separateView1.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -1).isActive = true
        separateView1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView1)
        collectionView1.topAnchor.constraint(equalTo: separateView1.bottomAnchor, constant: 0).isActive = true
        collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    func setupData() {
        let wea1 = Weather(time: "Now", weatherImg: "11", temp: "42º")
        let wea2 = Weather(time: "15", weatherImg: "12", temp: "41º")
        let wea3 = Weather(time: "16", weatherImg: "13", temp: "40º")
        let wea4 = Weather(time: "17", weatherImg: "14", temp: "39º")
        let wea5 = Weather(time: "18", weatherImg: "16", temp: "36º")
        let wea6 = Weather(time: "19", weatherImg: "15", temp: "30º")
        let wea7 = Weather(time: "20", weatherImg: "15", temp: "29º")
        let wea8 = Weather(time: "21", weatherImg: "15", temp: "27º")
        let wea9 = Weather(time: "22", weatherImg: "15", temp: "24º")
        
        weathers = [wea1, wea2, wea3, wea4, wea5, wea6, wea7, wea8, wea9]
        
        let w1 = Weather1(weekDay: "Monday", weatherImg: "12", maxMinTemp: "32      24")
        let w2 = Weather1(weekDay: "Tuesday", weatherImg: "11", maxMinTemp: "34     24")
        let w3 = Weather1(weekDay: "Wednesday", weatherImg: "13", maxMinTemp: "28     24")
        let w4 = Weather1(weekDay: "Monday", weatherImg: "12", maxMinTemp: "42      24")
        let w5 = Weather1(weekDay: "Monday", weatherImg: "12", maxMinTemp: "39      24")
        let w6 = Weather1(weekDay: "Monday", weatherImg: "12", maxMinTemp: "35      24")
        
        weathers1 = [w1, w2, w3, w4, w5, w6]
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
            cell.weather = weathers[indexPath.row]
            return cell
        } else {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! DayOfWeekCollectionViewCell
            cell1.weather1 = weathers1[indexPath.row]
            return cell1
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return weathers.count
        } else {
            return weathers1.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView {
            return 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView {
            return 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if collectionView == self.collectionView {
             return CGSize(width: 40, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: collectionView1.frame.size.width, height: 40)
        }
    }
    
}

