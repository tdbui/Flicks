//
//  FlicksDetailViewController.swift
//  Flicks
//
//  Created by Tuan Bui on 4/3/17.
//  Copyright © 2017 Tuan Bui. All rights reserved.
//

import UIKit

class FlicksDetailViewController: UIViewController,UIScrollViewDelegate, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    
    var movies: NSDictionary!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.bounds.size.height)
        
        let title = movies["title"] as? String
        titleLabel.text = title
        
        if let overview = movies["overview"] as? String {
            overviewLabel.text = overview
            overviewLabel.sizeToFit()
        }

        
        if let posterPath = movies["poster_path"] as? String {
            let baseUrl = "http://image.tmdb.org/t/p/w500"
            let posterImageUrl = NSURL(string: baseUrl + posterPath)
            posterView.setImageWith(posterImageUrl! as URL)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}



/*
 
 @IBOutlet weak var scrollView: UIScrollView!
 @IBOutlet weak var posterView: UIImageView!
 var image: UIImage!
 
 @IBOutlet weak var infoView: UIView!
 //@IBOutlet weak var infoView: UIView!
 //@IBOutlet weak var overViewLabel: UILabel!
 
 @IBOutlet weak var overViewLabel: UILabel!
 var movies: NSDictionary!
 
 @IBOutlet weak var titleLabel: UILabel!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 if let overview = movies["overview"] as? String {
 overViewLabel.text = overview
 overViewLabel.sizeToFit()
 }
 
 if let posterPath = movies["poster_path"] as? String {
 let baseUrl = "http://image.tmdb.org/t/p/w500"
 let posterImageUrl = NSURL(string: baseUrl + posterPath)
 posterView.setImageWith(posterImageUrl! as URL)
 }
 
 scrollView.delegate = self
 scrollView.sizeToFit()
 
 }
 
 override func viewDidAppear(_ animated: Bool) {
 infoView.sizeToFit()
 scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.bounds.size.height + (navigationController?.navigationBar.frame.height)!)
 }
 
 
 func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
 return posterView
 }
 
 
 
 /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
 
 
 
 
 */
