//
//  Extensions.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import UIKit.UITabBarController
import UIKit.UITableView

extension UITabBarController {

    func add(_ controllers: UIViewController...) {
        controllers.forEach {  viewControllers = [$0]  }
    }

}

extension UIView {

    func add(_ subviews: UIView...) {
        subviews.forEach {  addSubview($0)  }
    }

}

extension UITableView {

    func anchorTo(_ view: UIView) {

        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
    
    func applyChanges(section: Int = 0, deletions: [Int], insertions: [Int], updates: [Int]) {
        beginUpdates()
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        reloadRows(at: updates.map(IndexPath.fromRow), with: .none)
        endUpdates()
    }

}

extension IndexPath {
    static func fromRow(_ row: Int) -> IndexPath {
        return IndexPath(row: row, section: 0)
    }
}

extension UITableViewCell {
    
    func flashBackground() {
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.7, alpha: 1.0)
        
        UIView.animate(withDuration: 2.0) {
            
            self.backgroundView?.backgroundColor = .white
            
        }
        
    }
    
}

