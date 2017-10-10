//
//  MenuViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 06.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class MenuViewController:  UIViewController,UITableViewDataSource,UITableViewDelegate {


    var parse = JsonParse()
    
    @IBOutlet var tableView: UITableView!
    var info:String!
    var dict : [Int:String] = [:]
    @IBOutlet weak var backButton: UIImageView!

    
    override func viewDidLoad() {
        
        dict = parse.loadMenuFromJson(info: "Menu")
        
        let backgroundImage = UIImage(named: "2185.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .center
        super.viewDidLoad()
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.backToPriv(gesture:)))
        self.backButton.addGestureRecognizer(backGesture)
        backButton.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        cell.nameLabel.text = dict[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    ///for showing next detailed screen with the downloaded info
    

   @objc func backToPriv(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "information") as UIViewController
            dismiss(animated: true, completion: nil)
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "menuSecond") as! SecondMenuTableViewController
        vc.info = dict[indexPath.row]
        present(vc,animated: true, completion: nil)
    }
    
    
}
