//
//  StartViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 04.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var StartImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(StartViewController.goToData(gesture:)))
        self.StartImage.addGestureRecognizer(tapGesture)
        StartImage.isUserInteractionEnabled = true


    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToData(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Data", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "data") as UIViewController
            present(vc, animated: true, completion: nil)
        }
    }
    

    

}
