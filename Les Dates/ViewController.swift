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
        timeIntervalLbl.text = date.timeStamp()
        calendarLbl.text = date.calendarStr(date: date)
        ilyaLbl.text = date.composants(from: date)
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
    
    func timeStamp() -> String {
        let tempsEcoule = self.timeIntervalSinceNow
        return String(format: "%.2f", tempsEcoule)
    }
    
    func calendarStr(date: Date) -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Aujourd'hui"
        } else if calendar.isDateInYesterday(date) {
            return "Hier"
        } else if calendar.isDateInTomorrow(date) {
            return "Demain"
        } else if calendar.isDateInWeekend(date) {
            return "Tous dehors c'est le week-end!"
        }
        
        return "Rien de spécial."
    }
    
    func composants(from: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day, .hour, .minute], from: Date() , to: from )
        let mois:Int = components.month ?? 0
        let jour:Int = components.day ?? 0
        let heure:Int = components.hour ?? 0
        let minute:Int = components.minute ?? 0
        return "Mois: \(mois) Jour: \(jour) Heure: \(heure) Minute: \(minute)"
        /* print(components.month)
         print(components.day)
         print(components.hour)
         print(components.minute)
        return "Jour: \(Int?(components.day ?? 0))" */
    }

}
