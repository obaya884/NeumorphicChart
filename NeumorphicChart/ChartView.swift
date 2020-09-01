//
//  NeumorphicChartView.swift
//  NeumorphicChart
//
//  Created by 大林拓実 on 2020/09/01.
//  Copyright © 2020 Obayashi Takumi. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class ChartView: UIView {
    let caShapeLayerForBoundary: CAShapeLayer = CAShapeLayer.init()
    let caShapeLayerForBase:CAShapeLayer = CAShapeLayer.init()
    let caShapeLayerForValue:CAShapeLayer = CAShapeLayer.init()
    
    func drawChart(rate:Double){
        //グラフを表示
//        drawBoundaryView()
        drawBaseChart()
        drawValueChart(rate: rate)
        
        //グラフをアニメーションで表示
        let caBasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        caBasicAnimation.duration = 2.0
        caBasicAnimation.fromValue = 0.0
        caBasicAnimation.toValue = 1.0
        caShapeLayerForValue.add(caBasicAnimation, forKey: "chartAnimation")
    }
    
    /**
     Viewの境界となる円を表示
     */
    private func drawBoundaryView() {
        let shapeFrame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        caShapeLayerForBoundary.frame = shapeFrame
        
        caShapeLayerForBoundary.strokeColor = UIColor.clear.cgColor
        caShapeLayerForBoundary.fillColor = UIColor(hex: "EDF3FB").cgColor
        caShapeLayerForBoundary.lineWidth = 25
        caShapeLayerForBoundary.lineCap = .round
        
        let startAngle:CGFloat = CGFloat(0.0)
        let endAngle:CGFloat = CGFloat(Double.pi * 2.0)
        
        caShapeLayerForBoundary.path =
            UIBezierPath.init(
                arcCenter: CGPoint.init(x: shapeFrame.size.width / 2.0,
                                        y: shapeFrame.size.height / 2.0),
                radius: shapeFrame.size.width - 60,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true)
                .cgPath
        
        self.layer.addSublayer(caShapeLayerForBoundary)
    }
    
    /**
     円グラフの軸となる円を表示
     */
    private func drawBaseChart(){
        let shapeFrame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        caShapeLayerForBase.frame = shapeFrame
        
        caShapeLayerForBase.strokeColor = UIColor(hex: "E2E8F0").cgColor
        caShapeLayerForBase.fillColor = UIColor.clear.cgColor
        caShapeLayerForBase.backgroundColor = UIColor.clear.cgColor
        caShapeLayerForBase.lineWidth = 25
        caShapeLayerForBase.lineCap = .round
        
        let startAngle:CGFloat = CGFloat(0.0)
        let endAngle:CGFloat = CGFloat(Double.pi * 2.0)
        
        caShapeLayerForBase.path =
            UIBezierPath.init(
                arcCenter: CGPoint.init(x: shapeFrame.size.width / 2.0,
                                        y: shapeFrame.size.height / 2.0),
                radius: shapeFrame.size.width / 2.0,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true)
                .cgPath
        self.layer.addSublayer(caShapeLayerForBase)
    }
    
    /**
     円グラフの値を示す円(半円)を表示
     @param rate 円グラフの値の%値
     */
    private func drawValueChart(rate:Double){
        //CAShareLayerを描く大きさを定義
        let shapeFrame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        caShapeLayerForValue.frame = shapeFrame
        
        //CAShareLayerのデザインを定義
        caShapeLayerForValue.strokeColor = UIColor(hex: "030B5A").cgColor
        caShapeLayerForValue.fillColor = UIColor.clear.cgColor
        caShapeLayerForBase.backgroundColor = UIColor.clear.cgColor
        caShapeLayerForValue.lineWidth = 25
        caShapeLayerForValue.lineCap = .round
        
        //開始位置を時計の0時の位置にする
        let startAngle:CGFloat = CGFloat(-1 * Double.pi / 2.0)
        
        //終了位置を時計の0時起点で引数渡しされた割合の位置にする
        let endAngle :CGFloat = CGFloat(rate / 100 * Double.pi * 2.0 - (Double.pi / 2.0))
        
        //UIBezierPathを使用して半円を定義
        caShapeLayerForValue.path =
            UIBezierPath.init(
                arcCenter: CGPoint.init(x: shapeFrame.size.width / 2.0,
                                        y: shapeFrame.size.height / 2.0),
                radius: shapeFrame.size.width / 2.0,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true)
                .cgPath
        self.layer.addSublayer(caShapeLayerForValue)
    }
    
}
