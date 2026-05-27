//
//  DetailViewController.swift
//  Zodiac
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!
    
    @IBOutlet weak var horoscopeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!

    @IBOutlet weak var favoriteMenuItem: UIBarButtonItem!
    
    @IBOutlet weak var predictionTextView: UITextView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    let session = SessionManager()
    
    var isFavorite = false
    
    var prediction: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
        
        isFavorite = session.isFavoriteHoroscope(id: horoscope.id)
        setFavoriteIcon ()
        
        getPrediction(period: "daily")
    }
    
    func setFavoriteIcon () {
        if (isFavorite) {
            favoriteMenuItem.image = UIImage(systemName: "heart.fill")
        } else {
            favoriteMenuItem.image = UIImage(systemName: "heart")
        }
    }
    
    @IBAction func favoriteMenuClicked(_ sender: Any) {
        isFavorite = !isFavorite
        if isFavorite {
            session.setFavoriteHoroscope(id: horoscope.id)
        } else {
            session.setFavoriteHoroscope(id: "")
        }
        setFavoriteIcon ()
    }
    
    @IBAction func shareMenuClicked(_ sender: Any) {
        if let prediction = prediction {
            // set up activity view controller
            let textToShare = [ prediction ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func periodChanged(_ sender: UISegmentedControl) {
        var period = switch sender.selectedSegmentIndex {
        case 0:  // Daily
            "daily"
        case 1:  // Weekly
            "weekly"
        default: // Monthly
            "monthly"
        }
        getPrediction(period: period)
    }
    
    func getPrediction(period: String) {
        self.predictionTextView.text = "Consultando con las estrellas..."
        self.loadingView.isHidden = false
        Task {
            self.prediction = await HoroscopeApi.getPrediction(forSign: horoscope.id, withPeriod: period)
            
            DispatchQueue.main.async {
                self.predictionTextView.text = self.prediction
                self.loadingView.isHidden = true
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
