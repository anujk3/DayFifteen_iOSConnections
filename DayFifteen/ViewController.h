//
//  ViewController.h
//  DayFifteen
//
//  Created by Anuj Katiyal on 01/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

- (IBAction)tappedSendEmail:(id)sender;
- (IBAction)tappedSendSMS:(id)sender;
- (IBAction)tappedOpenSafari:(id)sender;
- (IBAction)tappedMakePhoneCall:(id)sender;
- (IBAction)tappedSendTweet:(id)sender;
- (IBAction)tappedSendFacebook:(id)sender;

@end

