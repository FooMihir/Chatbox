
//
//  RightTableViewCell.swift
//  Testing
//
//  Created by Mihir Shah on 3/17/17.
//  Copyright © 2017 Mihir Shah. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupRightLabelInCell(_ textMsg: String) {
        let codedLabel:UILabel = UILabel()
        codedLabel.frame = CGRect(x: 50, y: 2, width: 200, height: 200)
        codedLabel.textAlignment = .left
        codedLabel.text = textMsg
        codedLabel.numberOfLines = 0
        codedLabel.textColor = .black
        codedLabel.font = UIFont.systemFont(ofSize: 18)
        codedLabel.backgroundColor = .lightGray
        codedLabel.lineBreakMode = .byWordWrapping
        
        self.contentView.addSubview(codedLabel)
        codedLabel.translatesAutoresizingMaskIntoConstraints = false
        // codedLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // codedLabel.centerXAnchor.constraint(equalTo: codedLabel.superview!.centerXAnchor).isActive = true
        // codedLabel.centerYAnchor.constraint(equalTo: codedLabel.superview!.centerYAnchor).isActive = true
        codedLabel.widthAnchor.constraint(equalTo: codedLabel.superview!.widthAnchor, multiplier: 0.7).isActive = true
        codedLabel.trailingAnchor.constraint(equalTo: codedLabel.superview!.trailingAnchor, constant: 0).isActive = true
        codedLabel.topAnchor.constraint(equalTo: codedLabel.superview!.topAnchor, constant: 10).isActive = true
        codedLabel.bottomAnchor.constraint(equalTo: codedLabel.superview!.bottomAnchor, constant: -10).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // disable this
    }

}
