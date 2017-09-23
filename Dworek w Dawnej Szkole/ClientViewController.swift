//
//  ClientViewController.swift
//  Dworek w Dawnej Szkole
//
//  Created by Krystian Kulawiak on 05.07.2017.
//  Copyright © 2017 Krystian Kulawiak. All rights reserved.
//

import UIKit

class ClientViewController: DataBase, UITextFieldDelegate{

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var nextButton: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var postCode: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var homeNumber: UITextField!
    @IBOutlet weak var phoneNumb: UITextField!
    @IBOutlet weak var phoneNumb2: UITextField!
    @IBOutlet weak var mail: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(ClientViewController.backToPriv(gesture:)))
        self.backButton.addGestureRecognizer(backGesture)
        backButton.isUserInteractionEnabled = true
        
        let nextGesture = UITapGestureRecognizer(target: self, action: #selector(ClientViewController.goToNext(gesture:)))
        self.nextButton.addGestureRecognizer(nextGesture)
        nextButton.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ClientViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setup()
        update()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func backToPriv(gesture: UITapGestureRecognizer)
    {
        if (gesture.view as? UIImageView) != nil {
            save()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "data") as UIViewController
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func goToNext(gesture: UITapGestureRecognizer){
        
        if (gesture.view as? UIImageView) != nil {
            save()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "information") as UIViewController
            present(vc,animated: true, completion: nil)
        }
        
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
        name.delegate = self
        surname.delegate = self
        city.delegate = self
        postCode.delegate = self
        street.delegate = self
        homeNumber.delegate = self
        phoneNumb.delegate = self
        phoneNumb2.delegate = self
        mail.delegate = self
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    func save(){
        NAME = name.text!
        SURNAME = surname.text!
        CITY = city.text!
        POSTCODE = postCode.text!
        STREET = street.text!
        HOMENUMBER = homeNumber.text!
        PHONENUMBER = phoneNumb.text!
        PHONENUMBER2 = phoneNumb2.text!
        MAIL = mail.text!
        
    }
    func update(){
        name.text = NAME
        surname.text = SURNAME
        city.text = CITY
        postCode.text = POSTCODE
        street.text = STREET
        homeNumber.text = HOMENUMBER
        phoneNumb.text = PHONENUMBER
        phoneNumb2.text = PHONENUMBER2
        mail.text = MAIL
    }
    

}
