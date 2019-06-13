//
//  CreationView.swift
//  RealmTodo
//
//  Created by Igor-Macbook Pro on 14/06/2019.
//  Copyright © 2019 Igor-Macbook Pro. All rights reserved.
//

import UIKit


class CreationView : UIView {
    
    var sender : UIViewController = UIViewController()
    
    convenience init() {
        self.init()
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    
    
    private func configureUI() {
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 20
        
        let height = sender.view.frame.height
        let width = sender.view.frame.width
        
        self.frame.size.height = 0.7 * height
        self.frame.size.width = 0.8 * width
        
    }
    
}
