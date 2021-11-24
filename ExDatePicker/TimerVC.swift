//
//  TimerVC.swift
//  ExDatePicker
//
//  Created by 김종권 on 2021/11/23.
//

import UIKit

class TimerVC: UIViewController {
    
    private var timer = Timer()
    
    lazy var countDownDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .countDownTimer
        return picker
    }()
    
    lazy var confirmTimerSettingButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        return button
    }()
    
    lazy var countDownLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(countDownDatePicker)
        countDownDatePicker.translatesAutoresizingMaskIntoConstraints = false
        countDownDatePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        countDownDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(confirmTimerSettingButton)
        confirmTimerSettingButton.translatesAutoresizingMaskIntoConstraints = false
        confirmTimerSettingButton.topAnchor.constraint(equalTo: countDownDatePicker.bottomAnchor, constant: 24).isActive = true
        confirmTimerSettingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(countDownLabel)
        countDownLabel.translatesAutoresizingMaskIntoConstraints = false
        countDownLabel.topAnchor.constraint(equalTo: confirmTimerSettingButton.bottomAnchor, constant: 24).isActive = true
        countDownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    deinit {
        timer.invalidate()
    }
    
    @objc func didTapConfirmButton() {
        setTimer(with: countDownDatePicker.countDownDuration)
    }
    
    private func setTimer(with countDownSeconds: Double) {
        let startTime = Date()
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
            let remainSeconds = Int(countDownSeconds) - elapsedTimeSeconds
            guard remainSeconds >= 0 else {
                timer.invalidate()
                return
            }
            
            self?.countDownLabel.text = "남은시간 = \(remainSeconds)초"
        })
        
    }
}
