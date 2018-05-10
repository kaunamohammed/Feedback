//
//  HomeTabBarController.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .black

        let feedbackViewController = FeedbackViewController()
        let navigationController = FeedbackNavigationController(rootViewController: feedbackViewController)
        navigationController.tabBarItem = UITabBarItem(title: "Feedback", image: #imageLiteral(resourceName: "feedbackUnselected"), selectedImage: #imageLiteral(resourceName: "feedbackSelected"))

        add(navigationController)
    }

}
