//
//  ViewController.swift
//  EmptyMap
//
//  Created by Lee Kuan Xin on 02.10.17.
//  Copyright © 2017 HDMI. All rights reserved.
//

import UIKit
import HDMMapCore

class ViewController: HDMMapViewController, HDMMapViewControllerDelegate {

    
    //var mapViewController: HDMMapViewController!
    @IBOutlet weak var viewtest: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
//        print(viewtest.frame.origin)
//        print(viewtest.frame.width)
//        print(viewtest.frame.height)
//        mapView.frame = viewtest.frame
        //mapV = mapView
        //let deepMap = DeepMap(package: Bundle.main.path(forResource: "DeepMap", ofType: "zip")!)   // TODO: bang! *2
         //self.mapViewController = HDMMapViewController(map: deepMap!, locale: "en-US")
    
//        self.mapView.switchStyles(Bundle.main.path(forResource: "custom", ofType: "mapStyle")!, ruleFile: Bundle.main.path(forResource: "custom", ofType: "mapRule")!);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapViewController(_ controller: HDMMapViewController, tappedAt coordinate: HDMMapCoordinate, features: [HDMFeature]) {
        guard let feature = features.first else {return}
        print("Selecting object with ID \(feature.featureId)")
        //tell the map to select the object that has been touched
        self.mapView.selectFeature(withId: feature.featureId)
//        print(feature.bounds)
        print(feature.featureType)
//        print(feature.location.building)
        print(coordinate)
//        print(feature.location.course)
//        print(feature.location.floor)
//        print(feature.location.crs)
        
//                var ring0 : [HDMPoint] = []
//                let x = feature.bounds.center.x
//                let y = feature.bounds.center.y
//                let z = feature.bounds.center.z
//                let spanX = feature.bounds.span.latitudeDelta
//                let spanY = feature.bounds.span.longitudeDelta
//        var diameter = spanX
//        if spanY > spanX {
//            diameter = spanY
//        }
//        print(diameter)
//        let r = diameter/2.0
//       // print(radius)
//        var point = HDMPoint()
        
//        for i in 0...2 {
//            var point = HDMPoint(x+radius+(Double(i)/100000), y:y+radius, z: z)
//            ring0.append(point)
//        }
        
                    //var point1 = HDMPoint(x+radius), y:y+radius, z: z)
        //        let point2 = HDMPoint(x + spanX, y: y, z: z)
        //        let point3 = HDMPoint(x + spanX, y: y + spanY, z: z)
        //        let point4 = HDMPoint(x, y: y + spanY, z: z)
        
//                    for j in 0...25 {
//                    point = HDMPoint(x+radius+(Double(j)/100000), y:y+radius, z: z)
//                    ring0.append(point)
//                    }
//                    point = HDMPoint(x+radius, y:y+radius+(Double(i)/100000), z: z)
//                    ring0.append(point)
//                }
//                for i in ring0 {
//                    print(i)
//                    print(i.coordinate.x)
//                    print(i.coordinate.y)
//                    print(i.coordinate.z)
//                }
//                let poly = HDMPolygon.init(points: ring0 as! [HDMPoint])
//                let myFeature: HDMFeature = HDMPolygonFeature.init(polygon: poly, featureType: "poly", zmin: Float(z+1), zmax: Float(z+3))
//                mapView.add(myFeature)
        print(feature.attributes)
        print(feature.attributes[AnyHashable("maplabel:en")])
        //print(feature.attributes.index(forKey: "maplabel:en"))
        if feature.featureType == "stand_rooms"
            {
                mapView.move(to: coordinate, animated: true)
        var ring0 : [HDMPoint] = []
        let xo = feature.bounds.center.x
        let yo = feature.bounds.center.y
        let z = feature.bounds.center.z
        let spanX = feature.bounds.span.latitudeDelta
        let spanY = feature.bounds.span.longitudeDelta
        var w = spanX/2
        var h = spanY/2
        let x = xo - w
        let y = yo - h
//        print(spanX)
//        print(spanY)
        let point1 = HDMPoint(x, y: y, z: z)
        let point2 = HDMPoint(x + spanX, y: y, z: z)
        let point3 = HDMPoint(x + spanX, y: y + spanY, z: z)
        let point4 = HDMPoint(x, y: y + spanY, z: z)
        ring0.append(contentsOf: [point1, point2, point3, point4, point1])
//        for i in ring0 {
//            print(i)
//            print(i.coordinate.x)
//            print(i.coordinate.y)
//            print(i.coordinate.z)
//        }
        let poly = HDMPolygon.init(points: ring0 as! [HDMPoint])
        let myFeature: HDMFeature = HDMPolygonFeature.init(polygon: poly, featureType: "poly", zmin: Float(z+1), zmax: Float(z+1))
                myFeature.value(forKey: "maplabel:en", withLocale: "poly")
                myFeature.defaultDisplayName()
        mapView.add(myFeature)
        }
        if feature.featureType == "" {
            mapView.remove(feature)
        }
      
//        self.mapView.setRegion(HDMMapCoordinateRegionMake(feature.bounds.center.x,
//                                                          feature.bounds.center.y,
//                                                          feature.bounds.center.z,
//                                                          spanX,
//                                                          spanY), animated: true)
        
        //print(mapView.getPointOnScreen(fromMapPoint: coordinate))
        //let test = mapView.getPointOnScreen(fromMapPoint: coordinate)
        //test.x
        //test.y
        //viewtest.frame = CGRect.init(x: feature.bounds.center.x, y: feature.bounds.center.y, width: 100, height: 100)
        //mapView.getLocationOnMap(from: <#T##Float#>, screenPointY: <#T##Float#>)
       // projectCoordinateToScreenPoint
        //self.view.bringSubview(toFront: viewtest)
        //print(viewtest.frame)
    }
    
//    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        //mapView.getPointOnScreenFromMapPoint
//    }
    

    func mapViewControllerDidPan(_ controller: HDMMapViewController) {
        //self.view.bringSubview(toFront: viewtest)
    }
    func mapViewControllerDidStart(_ controller: HDMMapViewController, error: Error?) {
        mapView.set3DMode(false, animated: false)
        mapView.moveToFeature(withId: 19392, animated: false)
        //mapView.frame = mapV.frame
        //self.view.bringSubview(toFront: viewtest)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

