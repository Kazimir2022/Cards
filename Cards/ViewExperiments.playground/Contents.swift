//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  override func loadView() {
    setupViews()
  }
  
  // настройка представлений сцены
  private func setupViews() {
    self.view = getRootView()  // корневая сцена
    let redView = getRedView()
    let greenView = getGreenView()
    let whiteView = getWhiteView()
    let pinkView = getPinkView()
    redView.transform = CGAffineTransform(rotationAngle: .pi/3)
    
    
    
    set(view: greenView, toCenterOfView: redView)
    set(view: whiteView, toCenterOfView: greenView)
    
    
    
    self.view.addSubview(redView) // subView
    redView.addSubview(greenView)
    greenView.addSubview(whiteView)
    self.view.addSubview(pinkView)
    
  }
  
  // создание корневого представления
  private func getRootView() -> UIView {
    let view = UIView()
    view.backgroundColor = .gray
    return view
  }
  
  private func getRedView() -> UIView {
    let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
    let view = UIView(frame: viewFrame)
    view.backgroundColor = .red
    view.clipsToBounds = true
    return view
  }
  
  private func getGreenView() -> UIView {
    let greenView = UIView(frame: CGRect(x: 10, y: 10, width: 180, height: 180))
    greenView.backgroundColor = .green
    return greenView
  }
  
  private func getWhiteView() -> UIView {
    let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    whiteView.backgroundColor = .white
    return whiteView
  }
  
  private func getPinkView() -> UIView {
    let pinkView = UIView(frame: CGRect(x: 50, y: 300, width: 100, height: 100))
    pinkView.backgroundColor = .systemPink
    pinkView.layer.borderWidth = 5
    pinkView.layer.borderColor = UIColor.yellow.cgColor
    pinkView.layer.cornerRadius = 10//  округлость углов
    pinkView.layer.shadowOpacity = 0.95
    pinkView.layer.shadowRadius = 20
    pinkView.layer.shadowOffset = CGSize(width: 10, height: 20)
    pinkView.layer.shadowColor = UIColor.white.cgColor
    pinkView.layer.opacity = 0.7
    pinkView.layer.backgroundColor = UIColor.black.cgColor
    pinkView.layer.backgroundColor = UIColor.systemPink.cgColor
    
   
    let layer = CALayer()
    layer.backgroundColor = UIColor.black.cgColor
    layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
    pinkView.layer.addSublayer(layer)
    layer.cornerRadius = 10
    
    return pinkView
  }
  
  
  
  
  private func set(view moveView: UIView, toCenterOfView baseView: UIView){
    moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
  }
  
}





// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
