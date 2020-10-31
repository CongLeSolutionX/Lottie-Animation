//
//  ViewController.swift
//  Lottie-Animation
//
//  Created by Cong Le on 10/30/20.
//

import UIKit
import Lottie

class ViewController: UIViewController {

  lazy var animationView: AnimationView = {
    let jsonName = "Watermelon"
    let animation = Animation.named(jsonName)
    let animationView = AnimationView(animation: animation)
    animationView.contentMode = .scaleAspectFit
    animationView.frame = CGRect(x: 0, y: 500, width: 200, height: 200)
    animationView.animationSpeed = 2.0 // Speedy
    //animationView.animationSpeed = 0.5 // Slowdy
    animationView.loopMode = .repeat(3) // default loop modes
    return animationView
  }()
  
  var displayLink = CADisplayLink()
  var progressLablel =  UILabel()
  var frameLabel = UILabel()
  var timeLabel = UILabel()

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implamented")
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    displayLink = CADisplayLink(target: self, selector: #selector(animationCallback))
    displayLink.add(to: .current, forMode: RunLoop.Mode.default)

    setupView()
    setupConstraints()
  }
}
// MARK: - Setup views and constraints
extension ViewController {
  func setupView() {
    view.backgroundColor = .systemBackground
    view.addSubview(animationView)
    animationView.play()

    view.addSubview(progressLablel)
    view.addSubview(frameLabel)
  }
  
  func setupConstraints() {
    // Lottie AnimationView cannot be affected by below NSLayoutConstraints
    progressLablel.translatesAutoresizingMaskIntoConstraints = false
    frameLabel.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      progressLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      progressLablel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      frameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      frameLabel.topAnchor.constraint(equalTo: progressLablel.bottomAnchor),
      frameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]

    NSLayoutConstraint.activate(constraints)
    
    
  }
}

extension ViewController {
  @objc func animationCallback() {
    if animationView.isAnimationPlaying {
      // Display animation frame, time and progress in realtime
      progressLablel.text = "Progress Time: \(animationView.realtimeAnimationProgress)"
      frameLabel.text = "Frame: \(animationView.realtimeAnimationFrame)"
      
    }
  }
}
