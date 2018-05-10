//
//  FeedbackAPI.swift
//  Feedback
//
//  Created by Kauna Mohammed on 10/05/2018.
//  Copyright © 2018 NytCompany. All rights reserved.
//

import Foundation

class FeedbackAPI {

    typealias JSONObject = [String: Any]

    func getMessages(_ completion: @escaping ([JSONObject]) -> Void) {
        let incomingFeedback = randomMessages()

        DispatchQueue.main.async {
            completion(incomingFeedback)
        }
    }

    private let users = [ "Eleanor Wong",
                         "Benson Egemonye",
                         "Duc Tran",
                         "Oprah Winferey",
                         "Tyler Perry",
                         "Aubery Graham",
                         "Asilah Abdullah",
                         "Anonymous user",
                         "Eric Mohammed",
                         "Anonymous user" ]

    private let feedback = [ "I'd really like to see more of the nightclubs I actually go to...",
                            "The ratings showed a true reflection of the club 👍🏿",
                            "I'd like to know how many people are in the clubs before I go out",
                            "You guys stopped showing queue times. Can you continue!",
                            "Really amazing app! You get a car you get a car",
                            "Would it be possible to see inside videos of the club?",
                            "Can I know what music is playing?",
                            "I'm not very sure how to use the app, can you guys include a walk through?",
                            "When I go to a different city, I want to see their genres",
                            "I've had a really great experience so far, I'm ready to sign up now" ]

    private func randomMessages() -> [JSONObject] {
        return (0...arc4random_uniform(3))
            .map { _ -> JSONObject in
                let name = users[Int(arc4random_uniform(UInt32(users.count)))]
                return [
                    "id": UUID().uuidString,
                    "text": feedback[Int(arc4random_uniform(UInt32(feedback.count)))],
                    "username": name,
                    "timestamp": Date()
                ]
        }
    }

}

//Feedback(text: "I'd really like to see more of the nightclubs I actually go to...",
//         timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//         user: Userr(username: "Eleanor Wong")),
//
//Feedback(text: "The ratings showed a true reflection of the club 👍🏿",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Benson Egemonye")),
//
//Feedback(text: "I'd like to know how many people are in the clubs before I go out",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "James Smith")),
//
//Feedback(text: "You guys stopped showing queue times. Can you continue!",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Tyler Perry")),
//
//Feedback(text: "Really amazing app! You get a car you get a car",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Oprah Winferry")),
//
//Feedback(text: "Would it be possible to see inside videos of the club?",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Duc Tran")),
//
//Feedback(text: "Can I know what music is playing?",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Asilah Abdullah")),
//
//Feedback(text: "I'm not very sure how to use the app, can you guys include a walk through?",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Eric Mohammed")),
//
//Feedback(text: "When I go to a different city, I want to see their genres",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Anonymous")),
//
//Feedback(text: "I've had a really great experience so far, I'm ready to sign up now",
//timestamp: Date(timeIntervalSinceNow: TimeInterval(exactly: 1000)!),
//user: User(username: "Anonymous"))
