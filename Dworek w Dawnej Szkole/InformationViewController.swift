//
//  InformationViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 05.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class InformationViewController: DataBase,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var party: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var music: UITextField!
    @IBOutlet weak var amountChild: UITextField!
    @IBOutlet weak var amountPerson: UITextField!
    @IBOutlet weak var otherInformation: UITextView!
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var nextButton: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(InformationViewController.backToPriv(gesture:)))
        self.backButton.addGestureRecognizer(backGesture)
        backButton.isUserInteractionEnabled = true
        
        let nextGesture = UITapGestureRecognizer(target: self, action: #selector(InformationViewController.goToNext(gesture:)))
        self.nextButton.addGestureRecognizer(nextGesture)
        nextButton.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ClientViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setup()
        update()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        print(MUSIC)
        print(CITY)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func backToPriv(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "client") as UIViewController
            dismiss(animated: true, completion: nil)
        }
        save()
    }
    
    func goToNext(gesture: UITapGestureRecognizer){
        
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "information") as UIViewController
            present(vc,animated: true, completion: nil)
        }
        save()
        
    }
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTage=textField.tag+1;
        // Try to find next responder
        let nextResponder=textField.superview?.viewWithTag(nextTage) as UIResponder!
        
        if (nextResponder != nil){
            // Found next responder, so set it.
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }
    
    func setup(){
        party.delegate = self
        startTime.delegate = self
        music.delegate = self
        amountChild.delegate = self
        amountPerson.delegate = self
    }
    
    func update(){
        party.text = PARTY
        startTime.text = STARTTIME
        music.text = MUSIC
        amountChild.text = AMOUNTCHLID
        amountPerson.text = AMOUNTCHLID
        otherInformation.text = OTHERINFORMATION
    }
    
    func save(){
        PARTY = party.text!
        STARTTIME = startTime.text!
        MUSIC = music.text!
        AMOUNTCHLID = amountChild.text!
        AMOINTPERSON = amountPerson.text!
        OTHERINFORMATION = otherInformation.text!
    }


}
