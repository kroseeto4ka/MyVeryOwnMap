import UIKit
import MapKit

final class MainMapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let addButton = UIButton()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
    }
}

// MARK: - Setup View
extension MainMapViewController: MKMapViewDelegate {
    func setupView() {
        [mapView].forEach {
            view.addSubview($0)
        }
        
        [addButton].forEach {
            mapView.addSubview($0)
        }
        
        
        setupMapView()
        setupButton()
        setupLayout()
    }
    
    func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func setupButton() {
        addButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        addButton.imageView?.contentMode = .scaleAspectFill
        addButton.contentHorizontalAlignment = .fill
        addButton.contentVerticalAlignment = .fill
        addButton.backgroundColor = .white
        addButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 35
    }
}

// MARK: - Setup Layout
extension MainMapViewController {
    func setupLayout() {
        [mapView, addButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}

// MARK: - Setup Location
extension MainMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.first else { return }

        let region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1,
                                   longitudeDelta: 0.1)
        )

        mapView.setRegion(region, animated: true)
    }
}
