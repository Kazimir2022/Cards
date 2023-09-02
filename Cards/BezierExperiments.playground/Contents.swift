//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view
    createBezier(on: view)
  }
  
  private func createBezier(on view: UIView) {
    // 1
    // создаем графический контекст (слой)
    // на нем в дальнейшем будут рисоваться кривые
    let shapeLayer = CAShapeLayer()
    // 2
    // добавляем слой в качестве дочернего к корневому слою корневого представления
    view.layer.addSublayer(shapeLayer)
    // изменение цвета линий
    shapeLayer.strokeColor = UIColor.gray.cgColor
    // изменение толщины линий
    shapeLayer.lineWidth = 5
    
    shapeLayer.fillColor = UIColor.green.cgColor
    // shapeLayer.fillColor = UIColor.clear.cgColor
    //shapeLayer.lineDashPattern = [3, 20, 5]
    //  shapeLayer.lineDashPhase = 2
    shapeLayer.lineCap = .round
    //shapeLayer.strokeStart = 0.3
    //shapeLayer.strokeEnd = 0.7
    shapeLayer.lineJoin = .round
    // 3
    // создание фигуры
    shapeLayer.path = getPath().cgPath
  }
  
  private func getPath() -> UIBezierPath {
    // 1
    var path = UIBezierPath()
    // 2
    path.move(to: CGPoint(x: 50, y: 50))
    // 3
    path.addLine(to: CGPoint(x: 150, y: 50))
    // создание второй линии
    path.addLine(to: CGPoint(x: 150, y: 150))
    // path.addLine(to: CGPoint(x: 50, y: 50))
    
    path.close()
    
    // создание второго треугольника
    path.move(to: CGPoint(x: 50, y: 70))
    path.addLine(to: CGPoint(x: 150, y: 170))
    path.addLine(to: CGPoint(x: 50, y: 170))
    path.close()
    
    let rect = CGRect(x: 10, y: 10, width: 200, height: 100)
    path = UIBezierPath(rect: rect)
    return path
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
