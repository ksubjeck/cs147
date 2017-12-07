//
//  ProfileInfo.swift
//  vTag
//
//  Created by Cole DePasquale on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class Profile {
    
    var totalFriends: Int
    var totalSentTags: Int?
    
    init?(totalFriends: Int, totalSentTags: Int?){
        self.totalFriends = totalFriends
        self.totalSentTags = totalSentTags
    }
}

