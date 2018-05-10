//
//  Feedback.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import RealmSwift

class Feedback: Object {

    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var text: String = ""
    @objc dynamic var timestamp: Date = Date()
    @objc dynamic var user: Userr?
    override static func primaryKey() -> String {
        return "id"
    }

}
