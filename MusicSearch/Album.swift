//
//  Album.swift
//  MusicSearch
//
//  Created by Training on 26/08/15.
//  Copyright (c) 2015 Training. All rights reserved.
//

import UIKit

class Album: NSObject {
   
    var title:String!
    var artist:String!
    var genre:String!
    var artworkURL:String!
    
    init (title:String, artist:String, genre:String, artworkURL:String){
        super.init()
        
        self.title = title
        self.artist = artist
        self.genre = genre
        self.artworkURL = artworkURL
        
    }
    
    
}
