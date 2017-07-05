//
//  ViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 21.06.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var nextButton: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DataViewController.goToData(gesture:)))
        self.backButton.addGestureRecognizer(tapGesture)
        backButton.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goToData(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Start", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "start") as UIViewController
            dismiss(animated: true, completion: nil)
        }
    }

}

