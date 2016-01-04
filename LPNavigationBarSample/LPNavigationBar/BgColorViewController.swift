//
//  BgColorViewController.swift
//  LPNavigationBar
//
//  Created by litt1e-p on 16/1/4.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class BgColorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let kBgBgColorViewCellID: String = "kBgBgColorViewCellID"
    private let kNavigationBarChangePoint: CGFloat = 50.0
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kBgBgColorViewCellID)
        self.navigationController?.navigationBar.lp_setBackgroundColor(UIColor.clearColor())
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        self.scrollViewDidScroll(tableView)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.delegate = nil
        self.navigationController?.navigationBar.lp_reset()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color: UIColor   = UIColor(red:0/255.0, green:175/255.0, blue:240/255.0, alpha:1)
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY > kNavigationBarChangePoint {
            let alpha: CGFloat = min(1, 1 - ((kNavigationBarChangePoint + 64 - offsetY) / 64))
            self.navigationController?.navigationBar.lp_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            self.navigationController?.navigationBar.lp_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }

    // MARK: - tableView Delegate & Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header"
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(kBgBgColorViewCellID, forIndexPath: indexPath)
        cell!.textLabel?.text = "Section----\(indexPath.section) Row----\(indexPath.row)"
        return cell!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
