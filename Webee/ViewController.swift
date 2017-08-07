//
//  ViewController.swift
//  Webee
//
//  Created by Yuto Kobayashi on 8/4/17.
//  Copyright © 2017 Yuto Kobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, UIWebViewDelegate {
    
    
    @IBOutlet weak var WebView: UIWebView!
    @IBAction func back(_ sender: Any)
    {
        if WebView.canGoBack
        {
        WebView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any)
    {
    if WebView.canGoForward
    {
        WebView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any)
    {
        WebView.reload()
    }
    var searchController : UISearchController!
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
        {
            searchBar.resignFirstResponder()
            
            if let url = URL(string: searchBar.text!)
            {
                WebView.loadRequest(URLRequest(url: url))
            }
            
            else
            {
                print ("There has been an error on your URL load request")
            }
            
        }
        
        WebView.loadRequest(URLRequest(url: URL(string: "https://www.google.co.uk/")!))
        
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
        
    
       
    func updateSearchResults(for searchController: UISearchController) {
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
}
}
