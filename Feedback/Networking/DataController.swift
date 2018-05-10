import Foundation
import RealmSwift

class DataController {

  private let api: FeedbackAPI

  init(api: FeedbackAPI) {
    self.api = api
  }

  private var timer: Timer?

  // MARK: - fetch new messages

  func startFetchingMessages() {
    timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(fetch), userInfo: nil, repeats: true)
    timer!.fire()
  }

  func stopFetchingMessages() {
    timer?.invalidate()
  }

  @objc fileprivate func fetch() {
    api.getMessages { jsonObjects in
      let newFeedbacks = jsonObjects.map { object in
        
        return Feedback(value: object)
      }

        let realm = try! Realm()
        let me = Userr.defaultUser(in: realm)

      try! realm.write {
        for feedback in newFeedbacks {
          me.feedbaack.insert(feedback, at: 0)
        }
      }
    }
  }
}
