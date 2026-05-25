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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
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
