//
//  FeedbackNavigationController.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import UIKit

class FeedbackNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Write feedback",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(toNewReviewVC))

    }

    @objc func toNewReviewVC() {

        pushViewController(NewFeedbackViewController(), animated: true)

    }

}
