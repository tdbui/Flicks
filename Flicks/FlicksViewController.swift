//
//  FlicksViewController.swift
//  Flicks
//
//  Created by Tuan Bui on 4/2/17.
//  Copyright © 2017 Tuan Bui. All rights reserved.
//

import UIKit
import AFNetworking
import EZLoadingActivity
import MBProgressHUD

class FlicksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        networkRequest()
    }

    
    func networkRequest() {
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(
            with: request as URLRequest,
            completionHandler: { (data, response, error) in
                if let data = data {
                    if let responseDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                        //print("responseDictionary: \(responseDictionary)")
                        
                        // Recall there are two fields in the response dictionary, 'meta' and 'response'.
                        // This is how we get the 'response' field
                        //let responseFieldDictionary = responseDictionary["response"] as! NSDictionary
                        
                        // This is where you will store the returned array of posts in your posts property
                        
                        self.movies = responseDictionary["results"] as? [NSDictionary]
                        
                        self.tableView.reloadData()
                        
                    }
                }
        });
        task.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlicksCell", for: indexPath) as! FlicksCell
        
        let movie = self.movies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String

        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        //let posterPath = movie["poster_path"] as? String
        //print(posterPath)
        //let baseUrl = "https://image.tmdb.org/t/p/w500"
        //let finalurl = baseUrl + posterPath!
        //print(finalurl)
        //if let imageUrl = NSURL(string: finalurl) {
        //    cell.posterView.setImageWith(imageUrl as! URL)
        //}
        //else {
        //    cell.posterView.image = nil
        //}
        
        
        
        
        if let posterPath = movie["poster_path"] as? String {
            let baseUrl = "https://image.tmdb.org/t/p/w500"
        
            let imageUrl = URL(string: baseUrl + posterPath)
        
            
            
            cell.posterView.setImageWith(imageUrl! as URL)
        }
        else {
            cell.posterView.image = nil
        }
        
        
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let movies = movies {
            return movies.count
        }
        else {
            return 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! FlicksDetailViewController
        let cell = sender as! FlicksCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies![indexPath!.row]
        //let movie = filteredData![indexPath!.row]
        
        destinationVC.image = cell.posterView.image
        destinationVC.movies = movie
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
