//
//  ViewController.swift
//  GBMaps
//
//  Created by Константин Надоненко on 05.11.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }

    func configureMap(with coordinates: CLLocationCoordinate2D) {

        let camera = GMSCameraPosition.camera(withTarget: coordinates, zoom: 14)
        mapView.camera = camera

    }

    func setMarker(coordinates: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinates)
        marker.map = mapView
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Handle changes if location permissions
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            configureMap(with: coordinate)
            setMarker(coordinates: coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle failure to get a user’s location
    }
}

