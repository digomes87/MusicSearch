//
//  ItunesConnection.swift
//  MusicSearch
//
//  Created by Training on 26/08/15.
//  Copyright (c) 2015 Training. All rights reserved.
//

import UIKit

class ItunesConnection: NSObject {
   
    class func getAlbumForString(searchString:String, completionHandler:(Album)->()) {

        let escapedString = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let url = NSURL(string: "https://itunes.apple.com/search?term=\(escapedString!)&media=music")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
            if error == nil {
                let itunesDict = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: nil) as! NSDictionary
                
                let resultsArray = itunesDict.objectForKey("results") as! [Dictionary<String,AnyObject>]
                
                if resultsArray.count > 0 {
                    if let resultsDict = resultsArray.first {
                        let artist = resultsDict["artistName"] as! String
                        let artworkURL = resultsDict["artworkUrl100"] as! String
                        let albumTitle = resultsDict["collectionName"] as! String
                        let genre = resultsDict["primaryGenreName"] as! String
                        
                        let album = Album(title: albumTitle, artist: artist, genre: genre, artworkURL: artworkURL)
                        
                        completionHandler(album)

                    }
                }
                
                
                
                
            }
        })
        
        task.resume()
        
    }
    
}
