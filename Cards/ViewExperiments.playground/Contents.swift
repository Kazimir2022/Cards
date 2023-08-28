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
    self.view.addSubview(redView) // subView
    redView.addSubview(getGreenView())
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
    let greenView = UIView(frame: CGRect(x: 100, y: 100, width: 180, height: 180))
    greenView.backgroundColor = .green
    return greenView
  }
  
  
}





// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
