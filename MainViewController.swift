//
//  MainViewController.swift
//  dtapi
//
//  Created by Volodymyr on 10/10/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var specialityArray: [Speciality] = []
    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
    }
    
    func parseJSON(){
        
        guard let url = URL(string: "http://vps9615.hyperhost.name/Speciality/getRecords") else { return }
        
        //        var request = URLRequest(url: url)
        //        request.httpMethod = "POST"
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.setValue("utf-8", forHTTPHeaderField: "Charset")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode([Speciality].self, from: data)
                //                    let name = json[0].speciality_name
                for index in json{
                    print(index.speciality_code, index.speciality_code, index.speciality_name)
                    self.specialityArray.append(index)
                }
                DispatchQueue.main.sync {
                    self.tableViewController.reloadData()
                }
            }
            catch{
                print("error")
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpecialityTableViewCell
        cell.specialityIdLabel.text = specialityArray[indexPath.row].speciality_id
        cell.specialityCodeLabel.text = specialityArray[indexPath.row].speciality_code
        cell.specialityNameLabel.text = specialityArray[indexPath.row].speciality_name
        return cell
    }
    
}
