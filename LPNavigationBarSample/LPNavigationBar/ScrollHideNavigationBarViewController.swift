//
//  ScrollHideNavigationBarViewController.swift
//  LPNavigationBar
//
//  Created by litt1e-p on 16/1/4.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class ScrollHideNavigationBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let kScrollHideNavigationBarViewCellID = "kScrollHideNavigationBarViewCellID"
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate          = self
        tableView.dataSource        = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kScrollHideNavigationBarViewCellID)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.lp_reset()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY > 0 {
            if offsetY >= 44 {
                self.setNavigationBarTransformProgress(1)
            } else {
                self.setNavigationBarTransformProgress(offsetY / 44)
            }
        } else {
            self.setNavigationBarTransformProgress(0)
            self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        }
    }
    
    func setNavigationBarTransformProgress(progress: CGFloat) {
        self.navigationController?.navigationBar.lp_setTranslationY(-44 * progress)
        self.navigationController?.navigationBar.lp_setElementsAlpha(1 - progress)
    }
    
    // MARK - tableViewDelegate * tableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kScrollHideNavigationBarViewCellID, forIndexPath: indexPath)
        cell.textLabel?.text = "row:-----\(indexPath.row)"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
