//
//  ViewController.swift
//  simple-calc
//
//  Created by iguest on 10/16/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var specialOp = ""
    var input: [String] = []
    var answer = 0.0
    var specOpCount = 1
    @IBOutlet weak var calcDisplay: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        input.append((sender.titleLabel?.text)!)
        print(input)
    }

    @IBAction func btnOperationPressed(_ sender: UIButton) {
        var oneNum = ""
        for num in input {
            oneNum.append(num)
        }
        input = [oneNum,(sender.titleLabel?.text)!]
    }

    
    @IBAction func btnPlusPressed(_ sender: Any) {
    }
    @IBAction func btnMinusPressed(_ sender: Any) {
    }
    @IBAction func btnDividePressed(_ sender: Any) {
    }
    
    @IBAction func btnMultPressed(_ sender: Any) {
    }
    @IBAction func btnEqualsPressed(_ sender: Any) {
        let l = input.last
        if l != "count" && l != "avg" && l != "fact" {
            var oneNum = ""
            for i in 2...(input.count - 1) {
                oneNum.append(input[i])
            }
            input[2] = oneNum
            answer = calculate(input)
            if answer - round(answer) == 0.0 {
                calcDisplay.text = String(Int(round(answer)))
            } else {
                calcDisplay.text = String(answer)
            }
        }
        input = []
        specOpCount = 1
    }
    @IBAction func btnFactPressed(_ sender: Any) {
//        var index = 0
//        for item in input {
//            if item == (sender.titleLabel?.text)! {
//                index =
//            }
//        }
    }
    
    @IBAction func btnCountPressed(_ sender: Any) {
    }
    @IBAction func btnAvgPressed(_ sender: Any) {
    }
    
    @IBAction func cheatClear(_ sender: Any) {
        input = []
    }
    
    public func calculate(_ args: [String]) -> Double {
        let l = args.last
        if args.count == 3 && l != "count" && l != "avg" && l != "fact" {
            if args[1] == "+" {
                return Double(args[0])! + Double(args[2])!
            } else if args[1] == "*" {
                return Double(args[0])! * Double(args[2])!
            } else if args[1] == "/" {
                return Double(args[0])! / Double(args[2])!
            } else if args[1] == "-" {
                return Double(args[0])! - Double(args[2])!
            } else if args[1] == "%" {
                return Double(args[0])! - Double(args[2])! * (Double(args[0])! / Double(args[2])!)
            }
        } else if l == "count" {
            return Double(args.count - 1)
        } else if l == "avg" {
            var total = 0.0
            if args.count > 1 {
                for i in 0...(args.count - 2) {
                    total += Double(args[i])!
                }
                total = total / Double(args.count - 1)
            }
            return total
        } else if l == "fact" {
            var total = 1
            if args.count > 1 && Int(args[0]) ?? 0 > 0 {
                for i in 1...Int(args[0])! {
                    total = total * i
                }
            } else {
                total = 0
            }
            return Double(total)
        }
        return 0.0
    }
}

