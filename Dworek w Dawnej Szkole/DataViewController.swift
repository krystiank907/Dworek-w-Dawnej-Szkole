//
//  ViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 21.06.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class DataViewController: DataBase {

    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var nextButton: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        let date = Date()
        super.viewDidLoad()
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(DataViewController.backToStart(gesture:)))
        self.backButton.addGestureRecognizer(backGesture)
        backButton.isUserInteractionEnabled = true
        let nextGesture = UITapGestureRecognizer(target: self, action: #selector(DataViewController.goToNext(gesture:)))
        self.nextButton.addGestureRecognizer(nextGesture)
        nextButton.isUserInteractionEnabled = true
        dataPicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        let componenets = Calendar.current.dateComponents([.year, .month, .day], from: date)
        if let day = componenets.day, let month = componenets.month, let year = componenets.year {
            let time1 = "\(day)-\(month)-\(year)"
            DATA = time1
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func backToStart(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "start") as UIViewController
            dismiss(animated: true, completion: nil)
        }
    }
    func goToNext(gesture: UITapGestureRecognizer){
        
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "client") as UIViewController
            present(vc,animated: true, completion: nil)
        }
        
    }
    func dateChanged(_ sender: UIDatePicker) {
        let componenets = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = componenets.day, let month = componenets.month, let year = componenets.year {
            let time1 = "\(day)-\(month)-\(year)"
            DATA = time1
        }
    }


}

