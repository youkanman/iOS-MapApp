//
//  ViewController.swift
//  MapSample
//
//  Created by Yousuke Takano on 2017/07/12.
//  Copyright © 2017年 Transnet. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var testMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x = 140.000000 // 経度
        let y = 35.000000 // 緯度
        
        
        // 中心座標
        let center = CLLocationCoordinate2DMake(y, x)
        
        // 表示範囲
        let span = MKCoordinateSpanMake(1.00, 1.00)
        
        // 中心座標と表示範囲をマップに登録
        let region = MKCoordinateRegionMake(center, span)
        testMapView.setRegion(region, animated:true)
        
        // 中心にピンたて
        // ※ MKPointAnnotationに必要な情報を追加出来るよう拡張し、
        //   デリゲート実行時に順次処理できるようにする。
        
        let annotation = MKPointAnnotationExt()
        annotation.coordinate = CLLocationCoordinate2DMake(y, x)
        testMapView.addAnnotation(annotation)

        // 左下にピンたて
        let annotation1 = MKPointAnnotationExt()
        annotation1.coordinate = CLLocationCoordinate2DMake(y - 0.5, x - 0.5)
        annotation1.title = "左下"
        annotation1.subtitle = "\(annotation1.coordinate.latitude), \(annotation1.coordinate.longitude)"
        annotation1.pinColor = UIColor.cyan
        testMapView.addAnnotation(annotation1)

        // 右下にピンたて
        let annotation2 = MKPointAnnotationExt()
        annotation2.coordinate = CLLocationCoordinate2DMake(y - 0.5, x + 0.5)
        annotation2.pinColor = UIColor.blue
        testMapView.addAnnotation(annotation2)
        
        // 左上にピンたて
        let annotation3 = MKPointAnnotationExt()
        annotation3.coordinate = CLLocationCoordinate2DMake(y + 0.5, x - 0.5)
        testMapView.addAnnotation(annotation3)
        
        // 右上にピンたて
        let annotation4 = MKPointAnnotationExt()
        annotation4.coordinate = CLLocationCoordinate2DMake(y + 0.5, x + 0.5)
        testMapView.addAnnotation(annotation4)

        // デリゲートに登録
        testMapView.delegate = self
        
    }

    // アノテーションビューを返す
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // アノテーションビューを生成する
        let testPinView = MKPinAnnotationView()
        
        // アノテーションビューに座標、タイトル、サブタイトルを設定する
        testPinView.annotation = annotation
        
        // アノテーションビューに色設定
        //testPinView.pinTintColor = UIColor.blue
        if let ext = annotation as? MKPointAnnotationExt {
            testPinView.pinTintColor = ext.pinColor
        }
 
        // 吹き出しの表示をON
        testPinView.canShowCallout = true
        
        return testPinView
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

