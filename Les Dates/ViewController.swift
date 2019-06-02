//
//  ViewController.swift
//  Les Dates
//
//  Created by Benoit Cauchy on 2019-06-02.
//  Copyright © 2019 Benoit Cauchy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Obtenir une string au faormat de votre choix
    @IBOutlet weak var dateStringLbl: UILabel!
    
    //Time Interval (un peu de recherche)
    @IBOutlet weak var timeIntervalLbl: UILabel!
    
    //Si aujourd'hui, demain, hier, week-end
    @IBOutlet weak var calendarLbl: UILabel!
    
    //Il y a + mois, jours, heures, minutes etc
    @IBOutlet weak var ilyaLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


    @IBAction func dateChoisie(_ sender: UIDatePicker) {
        let date = sender.date
        dateStringLbl.text = date.convertirDate(date: date)
        // print(date)
    }
}

extension Date {

    func convertirDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "fr_CA")
        
        return dateFormatter.string(from: date)
    }

}
