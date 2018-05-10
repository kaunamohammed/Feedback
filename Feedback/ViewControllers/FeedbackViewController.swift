//
//  FeedbackViewController.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import UIKit
import RealmSwift

class FeedbackViewController: UIViewController {

    private let feedbackTableView: UITableView = {

        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    let backgroundView = UIImageView()

    private var dataController: DataController!
    fileprivate var feedback: List<Feedback>!
    private var feedbackToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.image = UIImage(named: "background")!
        view.add(feedbackTableView)
        setUpUI()
        
        let realm = try! Realm()
        Userr.defaultUser(in: realm)

        feedback = Userr.defaultUser(in: realm).feedbaack

        feedbackToken = feedback.observe { [weak self] (changes) in
            guard let feedbackTableView = self?.feedbackTableView else { return }

            switch changes {
            case .initial:
                feedbackTableView.reloadData()
                break
            case .update(_, let deletions, let insertions, let modifications):
                feedbackTableView.applyChanges(deletions: deletions, insertions: insertions, updates: modifications)
                break
            case .error(let error):
                print(error.localizedDescription)
            }

            self?.title = "FeedBacks (\(self?.feedback.count ?? 0))"

        }

        dataController = DataController(api: FeedbackAPI())
        dataController.startFetchingMessages()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataController.stopFetchingMessages()
    }

    @objc func toNewReviewVC() {

        navigationController?.pushViewController(NewFeedbackViewController(), animated: true)

    }
    
    @objc func reloadData() {
        
        feedbackTableView.reloadData()
        dataController.startFetchingMessages()
        
    }

}

// UI setup
extension FeedbackViewController {

    func setUpUI() {
        title = "Feedback"
        setUpTableView()
        setUpNavBar()

    }

    func setUpTableView() {

        feedbackTableView.dataSource = self
        feedbackTableView.anchorTo(view)
        feedbackTableView.backgroundView = backgroundView

    }

    func setUpNavBar() {

        navigationController?.navigationBar.tintColor = .gray
        
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Write feedback",
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(toNewReviewVC)),
                                              
                                              UIBarButtonItem(barButtonSystemItem: .refresh,
                                                              target: self,
                                                              action: #selector(reloadData))
        ]
    }

}

// MARK: - Table view set up
extension FeedbackViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let feed = feedback[indexPath.row]

        cell.textLabel?.numberOfLines = 0
        cell.flashBackground()
        cell.textLabel?.text  = feed.text
        cell.detailTextLabel?.text = feed.user?.username
        return cell
    }
}
