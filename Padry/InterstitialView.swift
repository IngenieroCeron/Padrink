//
//  InterstitialView.swift
//  Padry
//
//  Created by Eduardo Ceron on 31/08/21.
//

import GoogleMobileAds
import SwiftUI
import UIKit

final class Interstitial:NSObject, GADFullScreenContentDelegate {
    var interstitial: GADInterstitialAd?
    
    override init() {
        super.init()
        self.loadInterstitial()
    }
    
    func loadInterstitial(){
        // id real de mi app es:  ca-app-pub-8276758795635671/9346514274
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: request, completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed o load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        })
    }
    func showAd(){
        if self.interstitial != nil {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial?.present(fromRootViewController: root!)
        }
        else{
            print("Not ready")
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("ad did dismiss full screen content")
        self.loadInterstitial()
    }
    
}
