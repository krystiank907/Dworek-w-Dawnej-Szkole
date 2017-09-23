//
//  MenuViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 06.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class MenuViewController:  UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    final let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"


    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var nextButton: UIImageView!
    var nameArray = [String]()
    var dobArray = [String]()
    var imgURLArray = [String]()
    
    override func viewDidLoad() {
        self.downloadJsonWithURL()
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.dobLabel.text = dobArray[indexPath.row]
        
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imgView.image = UIImage(data: data as! Data)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    ///for showing next detailed screen with the downloaded info
    

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
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "actors"))
                
                if let actorArray = jsonObj!.value(forKey: "actors") as? NSArray {
                    for actor in actorArray{
                        if let actorDict = actor as? NSDictionary {
                            if let name = actorDict.value(forKey: "name") {
                                self.nameArray.append(name as! String)
                            }
                            if let name = actorDict.value(forKey: "dob") {
                                self.dobArray.append(name as! String)
                            }
                            if let name = actorDict.value(forKey: "image") {
                                self.imgURLArray.append(name as! String)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
    }
    
    
    func downloadJsonWithTask() {
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jsonData)
            
        }).resume()
    }
    
    
}
