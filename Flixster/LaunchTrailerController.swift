//
//  LaunchTrailerController.swift
//  Flixster
//
//  Created by R Alda on 2021-02-26.
//

import UIKit
import WebKit

class LaunchTrailerController: UIViewController, WKUIDelegate {
    
    @IBOutlet var webview: WKWebView!
    var movie: [String:Any]!
    var trailers = [[String:Any]]()

    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.uiDelegate = self
        view = webview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let movieID = self.movie["id"] as! String
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + movieID + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              self.trailers = dataDictionary["results"] as! [[String:Any]]
 
           }
        }
        
        task.resume()
                    
        let baseURL = "https://www.youtube.com/watch?v="
        let keyURL = self.trailers[0]["key"] as! String
        let myURL = URL(string: baseURL + keyURL)
        let myRequest = URLRequest(url: myURL!)
        self.webview.load(myRequest)

        // Do any additional setup after loading the view.
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
