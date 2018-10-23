//
//  CountryViewController.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/19/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var countries = [Country]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeCountryView()
        getCountryApi()
       
        
        // Do any additional setup after loading the view.
    }
  
    private func customizeCountryView()
    {
        //create normal button
        let leftbutton = UIButton(type: .custom)
        leftbutton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        let attribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30), NSAttributedString.Key.foregroundColor: UIColor.black]
        let attributeString = NSAttributedString(string: "Country", attributes: attribute)
        leftbutton.setAttributedTitle(attributeString, for: .normal)
        // create left button
        let leftBarButton = UIBarButtonItem(customView: leftbutton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        //setup table View
 
        countryTableView.delegate = self
        countryTableView.dataSource = self
        self.countryTableView.register(UINib(nibName: "CountryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CountryCell")
        //set up search bar
        searchBar.delegate = self
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).leftViewMode = .never
        searchBar.placeholder = "Search"
        searchBar.setImage(UIImage(named: "ic_search"), for: .search, state: .normal)
    }
    //set up table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryTableViewCell
        cell.textLabel?.text = countries[indexPath.row].name!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let viewController = CategoriesViewController(nibName: "CategoriesViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func getCountryApi()
    {
        let baseURL = "https://restcountries.eu/rest/v2/all"
        let searchText = ""
        let requestURL = baseURL + searchText

        Alamofire.request(requestURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let jsonValue = response.value {
                if let json = JSON(jsonValue).array{
                    var temp = Country()
                    for i in 0...json.count - 1 {
                        temp.name = json[i]["name"].string
                        temp.capital = json[i]["capital"].string
                        self.countries.append(temp)
                    }
                    self.countryTableView.reloadData()
                    
                }
                //print(self.countries)
                //print(self.countries.count)
            }
        }
        
    }
}
