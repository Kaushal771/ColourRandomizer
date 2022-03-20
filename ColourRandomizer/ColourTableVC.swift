//
//  ColourTableVC.swift
//  ColourRandomizer
//
//  Created by Kaushal Desai on 2022-03-15.
//

import UIKit

class ColourTableVC: UIViewController {
    
    var colours: [UIColor] = []
    
    enum Cells {
        static let colourCell = "ColourCell"
    }
    
    enum Segues {
        static let toColour = "ToSelectedColourVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColours()

        // Do any additional setup after loading the view.
    }
    
    func addRandomColours() {
        for _ in 0..<50 {
            colours.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SelectedColourVC
        destinationVC.colour = sender as? UIColor
    }
    

}

extension ColourTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colourCell) else {
            return UITableViewCell()
        }
        
        let colour = colours[indexPath.row]
        cell.backgroundColor = colour
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colour = colours[indexPath.row]
        performSegue(withIdentifier: Segues.toColour, sender: colour)
    }
}
