//
//  DBManager.swift
//  RealmTodo
//
//  Created by Igor-Macbook Pro on 13/06/2019.
//  Copyright © 2019 Igor-Macbook Pro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class DBManager {
    
    let realm = try! Realm()
    
    private static var defaultManager: DBManager = {
        
        let defManager = DBManager()
        
        return defManager
    }()
    
    var allTodosRelay = BehaviorRelay(value: [Todo]())
    
    class func shared() -> DBManager {
        defaultManager.retriveTodos()
        return self.defaultManager
    }
    
    public func saveTodo(name : String, dos : List<String>) {
        let todo = Todo()
        todo.dos = dos
        todo.name = name
        
        try! realm.write {
            realm.add(todo)
        }
        
        retriveTodos()
    }
    
    public func retrieveTodo(with predicate : String) -> Todo? {
        return realm.objects(Todo.self).filter(predicate).first
    }
    
    public func retriveTodos() {
        let result = realm.objects(Todo.self)
        
        var list = [Todo]()
        
        for item in result {
            list.append(item)
        }
        
        allTodosRelay.accept(list)
    }
    
    public func updateTodo(todo : Todo, update : @escaping (Todo) -> ()) {
        try! realm.write {
            update(todo)
        }
        
        retriveTodos()
    }
    
}
