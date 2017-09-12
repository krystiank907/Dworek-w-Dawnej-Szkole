//
//  MenuViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 06.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var nextButton: UIImageView!

    
    override func viewDidLoad() {
        let backgroundImage = UIImage(named: "2185.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .center
        
        super.viewDidLoad()
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(InformationViewController.backToPriv(gesture:)))
        self.backButton.addGestureRecognizer(backGesture)
        backButton.isUserInteractionEnabled = true
        
        let nextGesture = UITapGestureRecognizer(target: self, action: #selector(InformationViewController.goToNext(gesture:)))
        self.nextButton.addGestureRecognizer(nextGesture)
        nextButton.isUserInteractionEnabled = true

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! MenuTableViewCell
        //cell.titleLabel.text = listOfItems[indexPath.item]["title"]
        
        
        return cell
    }
    

    func backToPriv(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "information") as UIViewController
            dismiss(animated: true, completion: nil)
        }

    }
    
    func goToNext(gesture: UITapGestureRecognizer){
        
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "menu") as UIViewController
            present(vc,animated: true, completion: nil)
        }

        
    }
}
