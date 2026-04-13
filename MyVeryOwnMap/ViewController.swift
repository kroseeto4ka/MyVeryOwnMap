import UIKit
import MapKit

final class CollectionViewController: UIViewController {
    
    private let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
    }
}

// MARK: - Setup View
extension CollectionViewController: MKMapViewDelegate {
    func setupView() {
        view.addSubview(mapView)
        setupMapView()
        setupLayout()
    }
    
    func setupMapView() {
        //mapView.region = MKCoordinateRegion()
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
}


extension CollectionViewController {
    func setupLayout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
