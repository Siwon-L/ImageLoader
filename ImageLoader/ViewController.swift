//
//  ViewController.swift
//  ImageLoader
//
//  Created by 이시원 on 2023/03/02.
//

import UIKit

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
  }
  
  @IBAction func scondLoadButtonDidTap(_ sender: UIButton) {
  }
  
  @IBAction func thirdLoadButtonDidTap(_ sender: UIButton) {
  }
  
  @IBAction func fourthLoadButtonDidTap(_ sender: UIButton) {
  }
  
  @IBAction func fifthLoadButtonDidTap(_ sender: UIButton) {
  }
  
  @IBAction func allLoadButtonDidTap(_ sender: UIButton) {
  }
}

