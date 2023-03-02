//
//  ViewController.swift
//  ImageLoader
//
//  Created by 이시원 on 2023/03/02.
//

import UIKit

struct ImageURL {
  static let lion = "https://cdn.pixabay.com/photo/2020/06/12/22/04/lion-5292016_1280.jpg"
  static let turtle = "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/qgm4f5y9hOHP4b1opI1Mu_qIlIU.jpg"
  static let giraffe = "https://img.dongascience.com/yonhap/AKR20210318142400009_01_i.jpg"
  static let panda = "https://img.pikbest.com/back_our/20210410/bg/88f941d6bc3d3.jpg!w700wp"
  static let tiger = "https://img.mbn.co.kr/filewww/news/2021/11/27/163798723961a1b3a720f34.jpg"
}

final class ViewController: UIViewController {
  @IBOutlet weak var firstImageView: UIImageView!
  @IBOutlet weak var scondImageView: UIImageView!
  @IBOutlet weak var thirdImageView: UIImageView!
  @IBOutlet weak var fourthImageView: UIImageView!
  @IBOutlet weak var fifthImageView: UIImageView!
  
  private let imageDownloader = ImageDownloader()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func firstLoadButtonDidTap(_ sender: UIButton) {
    imageDownloadTask(
      imageView: firstImageView,
      url: ImageURL.lion
    )
  }
  
  @IBAction func scondLoadButtonDidTap(_ sender: UIButton) {
    imageDownloadTask(
      imageView: scondImageView,
      url: ImageURL.turtle
    )
  }
  
  @IBAction func thirdLoadButtonDidTap(_ sender: UIButton) {
    imageDownloadTask(
      imageView: thirdImageView,
      url: ImageURL.giraffe
    )
  }
  
  @IBAction func fourthLoadButtonDidTap(_ sender: UIButton) {
    imageDownloadTask(
      imageView: fourthImageView,
      url: ImageURL.panda
    )
  }
  
  @IBAction func fifthLoadButtonDidTap(_ sender: UIButton) {
    imageDownloadTask(
      imageView: fifthImageView,
      url: ImageURL.tiger
    )
  }
  
  @IBAction func allLoadButtonDidTap(_ sender: UIButton) {
    allImageDownloadTask()
  }
}

private extension ViewController {
  func showErrorAlert(message: String) {
    let alert = UIAlertController.makeAlert(message: message)
    self.present(alert, animated: true)
  }
  
  func imageDownloadTask(imageView: UIImageView, url: String) {
    imageView.image = UIImage(systemName: "photo")
    Task {
      do {
        guard let url = URL(
          string: url
        ) else { return }
        let image = try await imageDownloader.downloadImage(url: url)
        imageView.image = image
      } catch {
        showErrorAlert(message: error.localizedDescription)
      }
    }
  }
  
  func allImageDownloadTask() {
    let imageViews: [UIImageView] = [firstImageView, scondImageView, thirdImageView, fourthImageView, fifthImageView]
    let imageURLs: [String] = [ImageURL.lion, ImageURL.turtle, ImageURL.giraffe, ImageURL.panda, ImageURL.tiger]
    
    for i in 0..<5 {
      imageDownloadTask(imageView: imageViews[i], url: imageURLs[i])
    }
  }
}

private extension UIAlertController {
  static func makeAlert(message: String?) -> UIAlertController {
    let alert = UIAlertController(
      title: nil,
      message: message,
      preferredStyle: .alert
    )
    let okAction = UIAlertAction(title: "확인", style: .default)
    alert.addAction(okAction)
    return alert
  }
}

