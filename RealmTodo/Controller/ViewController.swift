//
//  ViewController.swift
//  RealmTodo
//
//  Created by Igor-Macbook Pro on 13/06/2019.
//  Copyright © 2019 Igor-Macbook Pro. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class ViewController: UIViewController {
    
    let todoTableView = UITableView()
    let dBag = DisposeBag()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
        
        driveTV()
        
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
       // DBManager.shared().saveTodo(name: "Hello!", dos: List<String>())
        
        let creationView = CreationView(frame: CGRect(x: 0.1 * self.view.frame.width, y: 0.1 * self.view.frame.height, width: 1, height: 1))
        
        self.view.addSubview(creationView)
    }
    

}


// UI

extension ViewController {
    
    private func configureUI() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        todoTableView.frame = CGRect(x: 10, y: 100, width: width - 20, height: height - 120)
        
        todoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(todoTableView)
    }
    
}

// Rx

extension ViewController {
    
    private func driveTV() {
        DBManager.shared().allTodosRelay.asDriver().drive(todoTableView.rx.items(cellIdentifier: "cell")) { row, item, cell in
            cell.textLabel?.text = item.name
        }
            .disposed(by: dBag)
        
        todoTableView.rx.itemSelected.subscribe { [unowned self] (indexPath) in
            
        }
            .disposed(by: dBag)
    }
    
}
