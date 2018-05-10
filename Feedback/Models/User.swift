//
//  User.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import RealmSwift

class Userr: Object {

    convenience init(username: String) {
        self.init()
        self.username = username
    }

    @objc dynamic var username: String = ""
    @objc dynamic var id: String = ""

    let feedbaack = List<Feedback>()
    
    override static func primaryKey() -> String {
        return "username"
    }

    private static func createDefaultUser(in realm: Realm) -> Userr {
        let me = Userr(username: "me")
        try! realm.write {
            realm.add(me)
        }
        return me
    }

    @discardableResult
    static func defaultUser(in realm: Realm) -> Userr {
        return realm.object(ofType: Userr.self, forPrimaryKey: "me")
            ?? createDefaultUser(in: realm)
    }

}
