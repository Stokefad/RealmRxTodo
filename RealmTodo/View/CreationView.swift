//
//  CreationView.swift
//  RealmTodo
//
//  Created by Igor-Macbook Pro on 14/06/2019.
//  Copyright © 2019 Igor-Macbook Pro. All rights reserved.
//

import UIKit
import RealmSwift


class CreationView : UIView {
    
    var sender : UIViewController = UIViewController()
    
    var yConstr = 0
    
    var tfList = [UITextField]()
    
    var lastButton = UIButton()
    
    let nameTF = UITextField()
    
    convenience init() {
        self.init()
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    
    
    private func configureUI() {
        
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = 20
        
        let height = sender.view.frame.height
        let width = sender.view.frame.width
        
        self.frame.size.height = 0.7 * height
        self.frame.size.width = 0.8 * width
        
        let confirmButton = UIButton()
        
        nameTF.frame = CGRect(x: 20, y: 100 + yConstr, width: Int(width * 0.7), height: 30)
        
        confirmButton.frame = CGRect(x: 0.3 * self.frame.width, y: 20, width: 0.4 * self.frame.width, height: 50)
        confirmButton.backgroundColor = UIColor.black
        confirmButton.addTarget(self, action: #selector(saveTodo), for: .touchUpInside)
        
        configureTextBoxes()
        
        self.addSubview(nameTF)
        self.addSubview(confirmButton)
    }
    
    @objc private func saveTodo() {
        self.removeFromSuperview()
        let list = List<String>()
        
        for tf in tfList {
            if let text = tf.text {
                list.append(text)
            }
        }
        
        guard let name = nameTF.text else {
            return
        }
        
        DBManager.shared().saveTodo(name: name, dos: list)
    }
    
    @objc private func addNewDo() {
        lastButton.removeFromSuperview()
        configureTextBoxes()
    }
    
    private func configureTextBoxes() {
        
        if 200 + yConstr > Int(self.frame.height - 70) {
            return
        }
        
        let width = self.frame.width
        
        let tf = UITextField()
        let addButton = UIButton()
        
        tf.frame = CGRect(x: 20, y: 200 + yConstr, width: Int(width * 0.7), height: 30)
        tf.backgroundColor = UIColor.gray
        yConstr += 70
        
        tfList.append(tf)
        lastButton = addButton
        
        addButton.frame = CGRect(x: Int(0.8 * width), y: Int(tf.frame.origin.y), width: 30, height: 30)
        addButton.backgroundColor = UIColor.black
        addButton.addTarget(self, action: #selector(addNewDo), for: .touchUpInside)
        
        self.addSubview(addButton)
        self.addSubview(tf)
    }
    
}
