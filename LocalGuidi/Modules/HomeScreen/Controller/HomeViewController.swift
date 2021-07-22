//
//  HomeViewController.swift
//  LocalGuidi
//
//  Created by Bayu Aslama  on 20/07/21.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate{
    
    
    var trips: [TripItem] = []
    var allTrips: [TripItem] = []

    var anotherTrips: [TripItem] = []
    var tripsByProvince: [TripItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextFieldView.delegate = self
        recommendationCollectionView.delegate = self
        recommendationCollectionView.dataSource = self
        anotherTripCollectionView.delegate = self
        anotherTripCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource  = self
        getTrips()
        print("ok")
        searchTextFieldView.addTarget(self, action: #selector(self.searchTrip), for: .editingChanged)
    }
    @IBOutlet weak var searchTextFieldView: UITextField!
    

    
    @IBOutlet weak var recommendationCollectionView: UICollectionView!
    @IBOutlet weak var anotherTripCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
   
    @objc func searchTrip() {
        if let query = searchTextFieldView.text, searchTextFieldView.text != "" {
        
        self.trips = self.allTrips.filter({ trip in
            guard let tripName = trip.name else { fatalError() }
            return tripName.lowercased().contains(query.lowercased())
        })
       
        self.recommendationCollectionView.reloadData()
        } else {
            print("ok")
            self.trips = self.getThreeRecommendation(self.allTrips)
            self.recommendationCollectionView.reloadData()

        }
    }
    func getTrips(){
        
        HomeAPI.shared.getTrips { result, error in
            guard let trips = result else { return }
            self.allTrips = trips
            self.trips = self.getThreeRecommendation(trips)
            self.anotherTrips = self.getAnotherReccomendation(trips)
            self.recommendationCollectionView.reloadData()
            self.anotherTripCollectionView.reloadData()
            
            self.tripsByProvince = self.filterTripsByProvince(trips)
            self.popularCollectionView.reloadData()
           
        }
    }
    
    func getThreeRecommendation(_ trips: [TripItem]) -> [TripItem]{
        
        let distance = trips.distance(from: 10, to: trips.endIndex)
        return trips.dropLast(distance)
    }
    
    func getAnotherReccomendation(_ trips: [TripItem]) -> [TripItem]{
        var anotherTrips: [TripItem] = []
        for (i, el) in trips.enumerated() {
            if i > 10{
                anotherTrips.append(el)
            }
        }
        return anotherTrips
    }
    
    func filterTripsByProvince(_ trips: [TripItem])-> [TripItem]{
        let groupedByProvince = Dictionary(grouping: trips) { (trip) -> Int in
            return trip.province!
        }
        var tripsByProvince: [TripItem] = []
        for (i, el) in groupedByProvince.enumerated() {
            if let tripsItem = groupedByProvince[i] {
                tripsByProvince.append(tripsItem[0])
            }
        }
        return tripsByProvince
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendationCollectionView {
            return trips.count

        } else if collectionView == popularCollectionView {
            return tripsByProvince.count

        } else {
            return anotherTrips.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommendationCollectionView {
            let trip = trips[indexPath.item]

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationCollectionViewCell", for: indexPath) as! RecommendationCollectionViewCell
            cell.setCell(trip)
            return cell
        } else if collectionView == popularCollectionView {
            let trip = tripsByProvince[indexPath.item]

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! RecommendationCollectionViewCell
            cell.setAnotherCell(trip)
            return cell
        } else {
            let trip = anotherTrips[indexPath.item]

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnotherTrips", for: indexPath) as! RecommendationCollectionViewCell
            cell.setCell(trip)
            return cell

        }
    }
    
    
    
}
