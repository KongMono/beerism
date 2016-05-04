//
//  EventController.swift
//  beerism
//
//  Created by Kong Mono on 4/29/16.
//  Copyright © 2016 beerism. All rights reserved.
//

import UIKit
import Alamofire
import MapleBacon
import SwiftyJSON
import PullToRefreshSwift
import DynamicColor

class EventController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
  
    var mDataEvents = [[String:AnyObject]]()

    @IBOutlet weak var mTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
        self.loadData()
        
        let options = PullToRefreshOption()
        options.backgroundColor = UIColor(hexString: BeerismColor.colorPrimaryDark)
        options.indicatorColor = UIColor.whiteColor()
        
        self.mTableView.addPullToRefresh(options: options,refreshCompletion: { [weak self] in
            self!.loadData()
            self!.mTableView.reloadData()
            self!.mTableView.stopPullToRefresh()
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.mTableView.fixedPullToRefreshViewForDidScroll()
    }
    
    override func loadView() {
        super.loadView()
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(hexString: BeerismColor.colorPrimaryDark)
    }

    
    func loadData(){
        Alamofire.request(.GET, API.event_service)
            .validate()
            .responseJSON { response in
                
                if response.result.value != nil{
                    if let resData = JSON(response.result.value!).arrayObject {
                        self.mDataEvents = resData as! [[String:AnyObject]]
                    }
                }
                
                if self.mDataEvents.count > 0 {
                    self.mTableView.reloadData()
                }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataEvents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell") as! CustomTableViewCell

        var dict = self.mDataEvents[indexPath.row]
        cell.mTime.text = dict["event_start"] as? String
        cell.mTitle.text = dict["event_name"] as? String
        cell.mPlace.text = dict["place_address"] as? String
        let string_image = dict["event_cover_img"] as? String
        let appendString = "http://128.199.228.8/craftbeer/" + string_image!
        cell.mImage.setImageWithURL(NSURL(string: (appendString))!)
      
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}