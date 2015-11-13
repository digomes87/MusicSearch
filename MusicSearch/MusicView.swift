//
//  MusicView.swift
//  MusicSearch
//
//  Created by Training on 26/08/15.
//  Copyright (c) 2015 Training. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    func addDataToMusicView (album:Album) {
    
        artworkImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: album.artworkURL)!)!)
        titleLabel.text = album.title
        artistLabel.text = album.artist
        genreLabel.text = album.genre
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
