//
//  LocationsTableViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 10/17/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit
import MapKit

class LocationsTableViewController: UITableViewController, MKMapViewDelegate {
    
    //MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        saltLakeCell.isHidden = true
        clintonCell.isHidden = true
        holladayCell.isHidden = true
        centervilleCell.isHidden = true
        southJordanCell.isHidden = true
        self.setupPinAnd(Map: saltLakeMap, Cllocation: saltLakeLocation, pinLocation: saltLakePinLocation, Name: "Salt Lake", Address: "613 E 400 S, Salt Lake City, UT 84102")
        self.setupPinAnd(Map: clintonMap, Cllocation: clintonLocation, pinLocation: clintonPinLocation, Name: "Clinton", Address: "1917 W 1800 N, Clinton, UT 84015")
        self.setupPinAnd(Map: holladayMap, Cllocation: holladayLocation, pinLocation: holladayPinLocation, Name: "Holladay", Address: "4670 S Holladay Village Plaza #106, Holladay, UT 84117")
        self.setupPinAnd(Map: centervilleMap, Cllocation: centervilleLocation, pinLocation: centervillePinLocation, Name: "Centerville", Address: "84 West Parrish Lane, Centerville, UT 84014")
        self.setupPinAnd(Map: southJordanMap, Cllocation: southJordanLocation, pinLocation: southJordanPinLocation, Name: "South Jordan", Address: "1685 Towne Center Dr, South Jordan, UT 84095")
    }
    
    //MARK: - Table View Height
    
    static weak var viewHeightDelegate: changeViewHeightDelegate?
    
    //MARK: - Hidding cells
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            
        case 1:
            
            if saltLakeCell.isHidden == true {
                return 0
            } else {
                return 173.0
            }
            
        case 3:
            
            if clintonCell.isHidden == true {
                return 0
            } else {
                return 173.0
            }
            
        case 5:
            
            if holladayCell.isHidden == true {
                return 0
            } else {
                return 173.0
            }
            
        case 7:
            
            if centervilleCell.isHidden == true {
                return 0
            } else {
                return 173.0
            }
            
        case 9:
            
            if southJordanCell.isHidden == true {
                return 0
            } else {
                return 190.0
            }
            
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            
            if saltLakeCell.isHidden == true {
                
                allCells[0].isHidden = false
                allCells[1].isHidden = true
                allCells[2].isHidden = true
                allCells[3].isHidden = true
                allCells[4].isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Down Arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: false)
                
                tableView.reloadData()
                
            } else {
                
                saltLakeCell.isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: true)
                
                tableView.reloadData()
            }
            
        case 2:
            
            if clintonCell.isHidden == true {
                
                allCells[0].isHidden = true
                allCells[1].isHidden = false
                allCells[2].isHidden = true
                allCells[3].isHidden = true
                allCells[4].isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Down Arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: false)
                
                tableView.reloadData()
                
            } else {
                
                clintonCell.isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: true)
                
                tableView.reloadData()
            }
            
        case 4:
            
            if holladayCell.isHidden == true {
                allCells[0].isHidden = true
                allCells[1].isHidden = true
                allCells[2].isHidden = false
                allCells[3].isHidden = true
                allCells[4].isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Down Arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: false)
                
                tableView.reloadData()
                
            } else {
                
                holladayCell.isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: true)
                
                tableView.reloadData()
            }
            
        case 6:
            
            if centervilleCell.isHidden == true {
                
                allCells[0].isHidden = true
                allCells[1].isHidden = true
                allCells[2].isHidden = true
                allCells[3].isHidden = false
                allCells[4].isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Down Arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: false)
                
                tableView.reloadData()
                
            } else {
                
                centervilleCell.isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: true)
                
                tableView.reloadData()
            }
            
        case 8:
            
            if southJordanCell.isHidden == true {
                
                allCells[0].isHidden = true
                allCells[1].isHidden = true
                allCells[2].isHidden = true
                allCells[3].isHidden = true
                allCells[4].isHidden = false
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Down Arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: false)
                
                tableView.reloadData()
                
            } else {
                
                southJordanCell.isHidden = true
                
                saltLakeButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                clintonButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                holladayButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                centervilleButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                southJordanButton.setImage(#imageLiteral(resourceName: "Up arrow"), for: .normal)
                
                LocationsTableViewController.viewHeightDelegate?.changeViewHeight(allCellsHidden: true)
                
                tableView.reloadData()
            }
            
        default:
            
            tableView.reloadData()
        }
    }
    
    // MARK: - Call
    
    @IBAction func callSaltLakeButtonTapped() {
        let alertController = UIAlertController(title: "Would you like to call Tonyburgers in Salt Lake City?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            UIApplication.shared.open(URL(string: "tel:8014190531")!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func callClintonButtonTapped() {
        let alertController = UIAlertController(title: "Would you like to call Tonyburgers in Clinton?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            UIApplication.shared.open(URL(string: "tel:8018256544")!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func callHolladayButtonTapped() {
        let alertController = UIAlertController(title: "Would you like to call Tonyburgers in Holladay?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            UIApplication.shared.open(URL(string: "tel:8016769686")!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func callCentervilleButtonTapped() {
        let alertController = UIAlertController(title: "Would you like to call Tonyburgers in Centerville?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            UIApplication.shared.open(URL(string: "tel:8012980473")!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func callSouthJordanButtonTapped() {
        let alertController = UIAlertController(title: "Would you like to call Tonyburgers in South Jordan?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            UIApplication.shared.open(URL(string: "tel:8016791194")!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saltLakeButtonTapped() {
        let indexPath = IndexPath(row: 0, section: 1)
        tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
    @IBAction func clintonButtonTapped() {
        let indexPath = IndexPath(row: 2, section: 1)
        tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
    @IBAction func holladayButtonTapped() {
        let indexPath = IndexPath(row: 4, section: 1)
        tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
    @IBAction func centervilleButtonTapped() {
        let indexPath = IndexPath(row: 6, section: 1)
        tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
    @IBAction func southJordanButtonTapped() {
        let indexPath = IndexPath(row: 8, section: 1)
        tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
    // MARK: - Get Directions
    
    @IBAction func getDirectionsToSaltLake() {
        presentDirectionsAlert(store: "Salt Lake", pinLocation: saltLakePinLocation)
    }
    
    @IBAction func getDirectionsToClinton() {
        presentDirectionsAlert(store: "Clinton", pinLocation: clintonPinLocation)
    }

    @IBAction func getDirectionsToCenterville() {
        presentDirectionsAlert(store: "Centerville", pinLocation: centervillePinLocation)
    }
    
    @IBAction func getDirectionsToHolladay() {
        presentDirectionsAlert(store: "Holladay", pinLocation: holladayPinLocation)
    }
    
    @IBAction func getDirectionsToSouthJordan() {
        presentDirectionsAlert(store: "South Jordan", pinLocation: southJordanPinLocation)
    }
    
    func presentDirectionsAlert(store: String, pinLocation: CLLocationCoordinate2D) {
        let alertController = UIAlertController(title: "Would you like to get directions to \(store) Tonyburgers?", message: nil, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            let coordinates = pinLocation
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, self.regionRadius, self.regionRadius)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
                ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "\(store) TonyBurgers"
            mapItem.openInMaps(launchOptions: options)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Mapkit
    
    let regionRadius: CLLocationDistance = 2000
    
    func centerMapOnLocation(location: CLLocation, map: MKMapView) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func setupPinAnd(Map: MKMapView, Cllocation: CLLocation, pinLocation: CLLocationCoordinate2D, Name: String, Address: String) {
        
        let Location = Cllocation
        
        let pinLocation = pinLocation
        let pin = MKPointAnnotation()
        pin.coordinate = pinLocation
    
        pin.title = title
        pin.subtitle = Address
        centerMapOnLocation(location: Location, map: Map)
        Map.addAnnotation(pin)
    }
    
    // MARK: - Mapkit locations
    
    private let saltLakeLocation = CLLocation(latitude: 40.762264, longitude:  -111.873179)
    private let saltLakePinLocation = CLLocationCoordinate2D(latitude: 40.762264, longitude:  -111.873179)
    private let clintonLocation = CLLocation(latitude: 41.139369, longitude: -112.062057)
    private let clintonPinLocation = CLLocationCoordinate2D(latitude: 41.139369, longitude: -112.062057)
    private let holladayLocation = CLLocation(latitude: 40.668837, longitude: -111.824656)
    private let holladayPinLocation = CLLocationCoordinate2D(latitude: 40.668837, longitude: -111.824656)
    private let centervilleLocation = CLLocation(latitude: 40.922503, longitude: -111.881213)
    private let centervillePinLocation = CLLocationCoordinate2D(latitude: 40.922503, longitude: -111.881213)
    private let southJordanLocation = CLLocation(latitude: 40.558268, longitude: -111.938203)
    private let southJordanPinLocation = CLLocationCoordinate2D(latitude: 40.558268, longitude: -111.938206)
    
    // MARK: - Outlets
    
    @IBOutlet var saltLakeMap: MKMapView!
    @IBOutlet var clintonMap: MKMapView!
    @IBOutlet var holladayMap: MKMapView!
    @IBOutlet var centervilleMap: MKMapView!
    @IBOutlet var southJordanMap: MKMapView!
    
    @IBOutlet var saltLakeButton: UIButton!
    @IBOutlet var clintonButton: UIButton!
    @IBOutlet var holladayButton: UIButton!
    @IBOutlet var centervilleButton: UIButton!
    @IBOutlet var southJordanButton: UIButton!
    
    @IBOutlet var saltLakeCell: UITableViewCell!
    @IBOutlet var clintonCell: UITableViewCell!
    @IBOutlet var holladayCell: UITableViewCell!
    @IBOutlet var centervilleCell: UITableViewCell!
    @IBOutlet var southJordanCell: UITableViewCell!
    
    @IBOutlet var allCells: [UITableViewCell]!
}

protocol changeViewHeightDelegate: class {
    func changeViewHeight(allCellsHidden: Bool)
}
