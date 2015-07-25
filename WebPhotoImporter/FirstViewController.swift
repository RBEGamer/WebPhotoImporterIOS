//
//  FirstViewController.swift
//  WebPhotoImporter
//
//  Created by Marcel Ochsendorf on 29.05.15.
//  Copyright (c) 2015 Marcel Ochsendorf. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

@IBOutlet var BaseURLText: UITextField!
@IBOutlet var FileExtentionText: UITextField!
    
@IBOutlet var CountFromText: UITextField!
@IBOutlet var CountToText: UITextField!
@IBOutlet var Leading0Text: UITextField!
    
@IBOutlet var ResultURLLabel: UILabel!
    
    
    
    
    
     var pos = 1;
    
    

    
    @IBAction func btn_start(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "DOWNLOAD STARTED", message:
            "The Download has started, please let the app open! you can show the progress of the Download in your Camera Roll. To cancel the download, close the App", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        
        
        
        let numberFormatters = NSNumberFormatter()
        let numbers = numberFormatters.numberFromString(CountFromText.text)
        let numberFloatValues = numbers?.longValue
        
        let numberFormattere = NSNumberFormatter()
        let numbere = numberFormattere.numberFromString(CountToText.text)
        let numberFloatValuee = numbere?.longValue
        
        if(CountFromText.text.toInt() < CountToText.text.toInt()){
       
        
        for (var j = CountFromText.text.toInt()!; j < CountToText.text.toInt()!; j++ ){
           
            
       
     
        
        let xNSNumber = j as NSNumber
        let xString : String = xNSNumber.stringValue
        
        
        
        var final_filename = "";
        let lnulls = Leading0Text.text.toInt()! - count(xString);
        
        println(lnulls)
        for var i = 0; i < lnulls; ++i {
        final_filename += "0";
            
        }
     
        
        
        final_filename += xString;
        println(final_filename)
        
        
        ResultURLLabel.text = BaseURLText.text + final_filename + FileExtentionText.text;
        
        
        
        if let imageUrl = NSURL(string: ResultURLLabel.text!) {
            let imageRequest: NSURLRequest = NSURLRequest(URL: imageUrl)
            let queue: NSOperationQueue = NSOperationQueue.mainQueue()
            NSURLConnection.sendAsynchronousRequest(imageRequest, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if data != nil {
                    let image = UIImage(data: data)
                   
                    
                    
                   
                                 
                    
                    //self.logoImageView.image = image
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
                   
                    
                }
            })
        }

            }
        
         }
        
        
        
        
       
    }
    
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                  // Do any additional setup after loading the view, typically from a nib.
        BaseURLText.delegate=self
         FileExtentionText.delegate=self
        
        Leading0Text.delegate=self

        CountFromText.delegate=self
        CountToText.delegate = self;
        
        
                //UIImageWriteToSavedPhotosAlbum(imageURL.image, nil, nil, nil);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //  UIImageWriteToSavedPhotosAlbum(imageToBeSaved, nil, nil, nil);
    }
    }
    

   // ImageLoader.sharedLoader.imageForUrl(urlString, completionHandler:{(image: UIImage?, url: String) in
   // self.imageView.image = image
   // })
 


