//
//  NewFeedbackViewController.swift
//  Feedback
//
//  Created by Kauna Mohammed on 09/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import UIKit

class NewFeedbackViewController: UIViewController {

    let pageDescriptionLabel: UILabel = {

        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Feedback is needed to help us improve your nightlife 😅"
        return label
    }()

    let feedbackTextView: UITextView = {

        let textView = UITextView()
        textView.keyboardDismissMode = .interactive
        return textView
    }()

    let submitButton: UIButton = {

        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        return button
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        addSubViews()
    }

    func addSubViews() {
        view.add(stackView, submitButton)
        stackView.addArrangedSubview(pageDescriptionLabel)
        stackView.addArrangedSubview(feedbackTextView)
        addConstraints()
    }

    func addConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true

        feedbackTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44)
        submitButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true

    }

}
