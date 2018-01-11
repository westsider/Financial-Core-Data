//
//  ViewController.swift
//  Financial Core Data
//
//  Created by Warren Hansen on 1/11/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

//  [ ] make network call - Network Service
//  [ ] save date, close to core data
//  [ ] tableview controller, pull data from core data

import UIKit

class ViewController: UIViewController {
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }

    @IBOutlet weak var mailText: UITextField!
    
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLastLogin()
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        do {
            try login()
            
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form!", message: "Please fill out both email and password", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email Format", message: "Please make sure you format your email correctly", vc: self)
        } catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password too short", message: "Password should be at least 8 characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
    }
    
    //MARK: - TODO - create new account
    @IBAction func signUpAction(_ sender: UIButton) {
    }
    
    func login() throws {
        
        let email = mailText.text!
        let password = passText.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        persistLogin(email: email, pass: password)
        segueToPricesVC()
    }
    
    func persistLogin(email:String, pass:String) {
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(pass, forKey: "pass")
    }
    
    func getLastLogin() {
        let defaults = UserDefaults.standard
        if let mail = defaults.object(forKey: "email") as? String {
            mailText.text = mail
        }
        if let pass = defaults.object(forKey: "pass") as? String {
            passText.text = pass
        }
    }
    
    private func segueToPricesVC() {
        let pricesVC:PricesViewController = storyboard?.instantiateViewController(withIdentifier: "pricesVC") as! PricesViewController
        navigationController?.pushViewController(pricesVC, animated: true)
    }
    
    
}





