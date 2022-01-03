//
//  ViewController.swift
//  InDialogue
//
//  Created by Денис Соснин on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Кнопка "Залогиниться"

    @IBAction func singIn(_ sender: Any) {
        
        print("singIn")
    }
    
    // Кнопка "Забыли пароль"
    @IBAction func forgotPass(_ sender: Any) {
        print("forgotPass")
    }
    
    
    // Кнопка "Зарегистрироваться"
    
    
    @IBAction func singUpforInDialogue(_ sender: Any) {
        print("singUpforInDialogue")
    }
 
    // Смена языка на Английский
    
    @IBAction func changeEnglish(_ sender: Any) {
        print("changeEnglish")
        
    }
    // Смена языка на Русский
    
    @IBAction func changeRussian(_ sender: Any) {
        print("singUpforInDialogue")
        
    }
    
    
}

