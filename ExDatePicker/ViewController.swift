//
//  ViewController.swift
//  ExDatePicker
//
//  Created by 김종권 on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var timeDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "picker.datePickerMode = .time"
        return label
    }()
    
    lazy var timeDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.addTarget(self, action: #selector(didChangeTimeDatePicker(_:)), for: .valueChanged)
        return picker
    }()
    
    lazy var dateDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "picker.datePickerMode = .date"
        return label
    }()
    
    lazy var dateDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    lazy var dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "picker.datePickerMode = .dateAndTime"
        return label
    }()
    
    lazy var dateAndTimeDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        return picker
    }()
    
    lazy var countDownDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "picker.datePickerMode = .countDownTimer"
        return label
    }()
    
    lazy var countDownDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .countDownTimer
        picker.addTarget(self, action: #selector(didChangeCountDownDatePicker(_:)), for: .valueChanged)
        return picker
    }()
    
    lazy var routeToTimerButton: UIButton = {
        let button = UIButton()
        button.setTitle("타이머 화면으로 이동", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(didTapRouteToTimerButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(timeDatePicker)
        timeDatePicker.translatesAutoresizingMaskIntoConstraints = false
        timeDatePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        timeDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(timeDateLabel)
        timeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeDateLabel.bottomAnchor.constraint(equalTo: timeDatePicker.topAnchor, constant: -8).isActive = true
        
        
        view.addSubview(dateDatePicker)
        dateDatePicker.translatesAutoresizingMaskIntoConstraints = false
        dateDatePicker.topAnchor.constraint(equalTo: timeDatePicker.bottomAnchor, constant: 100).isActive = true
        dateDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(dateDateLabel)
        dateDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateDateLabel.bottomAnchor.constraint(equalTo: dateDatePicker.topAnchor, constant: -8).isActive = true
        
        
        view.addSubview(dateAndTimeDatePicker)
        dateAndTimeDatePicker.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeDatePicker.topAnchor.constraint(equalTo: dateDatePicker.bottomAnchor, constant: 100).isActive = true
        dateAndTimeDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(dateAndTimeLabel)
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateAndTimeLabel.bottomAnchor.constraint(equalTo: dateAndTimeDatePicker.topAnchor, constant: -8).isActive = true
        
        
        view.addSubview(countDownDatePicker)
        countDownDatePicker.translatesAutoresizingMaskIntoConstraints = false
        countDownDatePicker.topAnchor.constraint(equalTo: dateAndTimeDatePicker.bottomAnchor, constant: 100).isActive = true
        countDownDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(countDownDateLabel)
        countDownDateLabel.translatesAutoresizingMaskIntoConstraints = false
        countDownDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countDownDateLabel.bottomAnchor.constraint(equalTo: countDownDatePicker.topAnchor, constant: -8).isActive = true
        
        view.addSubview(routeToTimerButton)
        routeToTimerButton.translatesAutoresizingMaskIntoConstraints = false
        routeToTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        routeToTimerButton.topAnchor.constraint(equalTo: countDownDatePicker.bottomAnchor).isActive = true
    }
    
    @objc func didChangeTimeDatePicker(_ picker: UIDatePicker) {
        print(picker.date)
    }
    
    @objc func didChangeCountDownDatePicker(_ picker: UIDatePicker) {
        print(picker.countDownDuration)
    }
    
    @objc private func didTapRouteToTimerButton() {
        let vc = TimerVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}

