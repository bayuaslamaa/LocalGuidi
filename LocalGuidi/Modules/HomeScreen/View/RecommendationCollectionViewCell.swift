//
//  RecommendationCollectionViewCell.swift
//  LocalGuidi
//
//  Created by Bayu Aslama  on 21/07/21.
//

import UIKit
import SDWebImage

class RecommendationCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var containerView: UIView!{
        didSet {
                  self.containerView.layer.cornerRadius = 7

            self.containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                  self.containerView.layer.shadowOpacity = 1
                  self.containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
                  self.containerView.layer.shadowRadius = 4
                  self.containerView.layer.shadowPath = UIBezierPath(roundedRect: self.containerView.bounds, cornerRadius: 10).cgPath
                  self.containerView.clipsToBounds = false
              }
    }
    @IBOutlet weak var tripImageView: UIImageView!{
        didSet{
            tripImageView.layer.cornerRadius = 7
        }
    }
    @IBOutlet weak var typeTripLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var provinceDestination: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    let helper = Helper.shared

    func setCell(_ trip: TripItem){
        if let image = trip.img?.first {
            tripImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "banner"))
        } else {
            tripImageView.image = UIImage(named: "banner")
        }
        provinceDestination.text = "\(helper.getProvince(trip.province)): \(trip.name ?? "")"

        if let tripPrice = trip.price {
            priceLabel.text = "From IDR \(tripPrice) / pax"
        }
        typeTripLabel.text = trip.isPrivate == 1 ? "Private Trip": "Open Trip"
        durationLabel.text =  trip.duration
     
    }
    
    func setAnotherCell(_ trip: TripItem){
        if let image = trip.img?.first {
            tripImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "banner"))
        } else {
            tripImageView.image = UIImage(named: "banner")
        }
        provinceDestination.text = "\(helper.getProvince(trip.province))"
        
    }
}
