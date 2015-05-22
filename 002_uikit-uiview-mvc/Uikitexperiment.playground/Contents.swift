import UIKit

let myView = UIView(frame: CGRect(x: 0, y:0, width: 500, height: 700))
myView.backgroundColor = UIColor.redColor()

let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
myLabel.text = "Hallo Welt"
myLabel.backgroundColor = UIColor.greenColor()
myLabel.sizeToFit()