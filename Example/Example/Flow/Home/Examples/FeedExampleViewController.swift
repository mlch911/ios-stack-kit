//
//  FeedExampleViewController.swift
//  Example
//
//  Created by Russell Warwick on 09/05/2021.
//

import UIKit
import SharkStackKit
import SharkUtils

struct Post {
    let title: String
    let context: String
    let image: String
}

final class PostView: UIView {
    
    // MARK: - UI
    
    private let image = UIImageView().with {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let title = UILabel().with {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
    }
    
    private let context = UILabel().with {
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    // MARK: - Init
    
    init(post: Post){
        super.init(frame: .zero)
        setConstraints()
        self.title.text = post.title
        self.context.text = post.context
        self.image.image = UIImage(named: post.image)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Set up

    private func setConstraints(){
        backgroundColor = .white
        
        VStack {
            image.withAspectRatio(2.5)
            Spacer(h: 15)
            title
            Spacer(h: 10)
            context
        }.margin(.bottom(20))
    }
}

final class FeedExampleViewController: UIViewController {
    
    // MARK: - Data
    
    private let posts = [Post(title: "Xcode tips", context: "Write code faster, build better tests, and navigate around projects more efficiently.", image: "image1"),
                         Post(title: "The NSDateInterval Object", context: "Today I want to take a few minutes to talk about the NSDateInterval object.", image: "image2"),
                         Post(title: "Publishers with Combine", context: "This week I want to focus on the chaining asynchronous jobs using two main operators that the Combine framework provides us.", image: "image3"),
                         Post(title: "Swift's print in Depth", context: "Ah, print. Probably the most known, the most used, the most popular debugging tool, and probably the most loved line of code of all time. You have undoubtedly used print before, if not in Swift, in other languages. The vast majority of programmers have started their software building skills with a print or equivalent somewhere.", image: "image4")]
    
    // MARK: - Init
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setConstraints()
        title = "Feed Example"
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Set up

    private func setConstraints(){
        view.backgroundColor = Constants.colors.background
        
        /// Note: You will face performance issues if you're trying to use this for a large dataset. For large datasets you will want to use SharkListKit.
        /// https://github.com/gymshark/ios-shark-list-kit
        
        view.ScrollView(spacing: 20) {
            posts.compactMap({
                PostView(post: $0)
            })
        }.margin(.horizontal(20))
    }
}