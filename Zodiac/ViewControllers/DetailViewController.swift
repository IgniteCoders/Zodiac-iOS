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
    
    let session = SessionManager()
    
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
        
        isFavorite = session.isFavoriteHoroscope(id: horoscope.id)
        setFavoriteIcon ()
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
        // text to share
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
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
