//
//  Models.swift
//  RealmTodo
//
//  Created by Igor-Macbook Pro on 13/06/2019.
//  Copyright © 2019 Igor-Macbook Pro. All rights reserved.
//

import Foundation
import RealmSwift


class Todo : Object {
    @objc dynamic var name : String = ""
    dynamic var dos : List<String> = List<String>()
}
