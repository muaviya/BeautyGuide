//
//  CommentTableViewController.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 31.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    
    var comment: [Comment] =
    
        [Comment(nameUser: "Лаура", dateComment: "08.01.2016", imageUser: "50.png", description: "Все очень клево, обслуживание на уровне."),
        Comment(nameUser: "Асият", dateComment: "09.01.2016", imageUser: "51.png", description: "Мне нравится, советую."),
        Comment(nameUser: "Патя", dateComment: "12.01.2016", imageUser: "52.png", description: "Супер! Цена + качество!"),
        Comment(nameUser: "Зоя", dateComment: "15.01.2016", imageUser: "53.png", description: "Салон оказался очень близко, спс не пришлось куда то ехать ..."),
        Comment(nameUser: "Карина", dateComment: "17.01.2016", imageUser: "54.png", description: "Плюсую"),
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Удалить title у кнопки  back
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // Самомасштабирование
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comment.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellComment = tableView.dequeueReusableCellWithIdentifier("CellComment", forIndexPath: indexPath) as! ManCommentTableViewCell
        
        // Настройка ячейки
        cellComment.nameUser.text = comment[indexPath.row].nameUser
        cellComment.descriptionLabel.text = comment[indexPath.row].description
        cellComment.dateComment.text = comment[indexPath.row].dateComment
        cellComment.userImage.image = UIImage(named: comment[indexPath.row].imageUser)

        
        return cellComment
    }


}
