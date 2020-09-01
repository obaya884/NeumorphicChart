//
//  ViewController.swift
//  NeumorphicChart
//
//  Created by 大林拓実 on 2020/09/01.
//  Copyright © 2020 Obayashi Takumi. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class ViewController: UIViewController {
    
    @IBOutlet weak var chartBoundaryView: EMTNeumorphicView!
    @IBOutlet weak var chartView: ChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeChartBoundary(view: chartBoundaryView)
        
        chartView.drawChart(rate: 60.0)
    }

    func makeChartBoundary(view: EMTNeumorphicView) {
        view.backgroundColor = self.view.backgroundColor
        
        view.neumorphicLayer?.elementBackgroundColor = self.view.backgroundColor!.cgColor
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.neumorphicLayer?.depthType = .convex
        view.neumorphicLayer?.elementDepth = 10
        
        let innerViewWidth = view.frame.size.width / 2
        let innerViewHeight = view.frame.size.height / 2

        let innerView = EMTNeumorphicView(frame: CGRect(x: innerViewWidth / 2 - 10, y: innerViewHeight / 2 - 10, width: innerViewWidth + 20, height: innerViewHeight + 20))

        innerView.neumorphicLayer?.elementBackgroundColor = self.view.backgroundColor!.cgColor
        innerView.layer.cornerRadius = innerView.frame.width / 2
        innerView.layer.masksToBounds = true
        innerView.backgroundColor = .clear
        innerView.neumorphicLayer?.depthType = .convex
        innerView.neumorphicLayer?.elementDepth = 10
        
        view.addSubview(innerView)
    }

}

