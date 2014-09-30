//
//  ViewController.m
//  DayFifteen
//
//  Created by Anuj Katiyal on 01/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Send an Email and its delegate

- (IBAction)tappedSendEmail:(id)sender{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc]init];
    [mailComposer setSubject:@"The email subject"];
    [mailComposer setMessageBody:@"The email body." isHTML:NO];
    mailComposer.mailComposeDelegate = self;
    [self presentViewController:mailComposer animated:YES completion:nil];
    
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result)
    {
        case MFMailComposeResultSent:
            //mail sent
            break;
        case MFMailComposeResultCancelled:
            //mail cancelled
            break;
        case MFMailComposeResultSaved:
            //draft saved
            break;
        case MFMailComposeResultFailed:
            //failure
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Send a Message and its delegate

- (IBAction)tappedSendSMS:(id)sender{
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc]init];
        messageComposer.body = @"this is it";
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }
}

-(void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result) {
        case MessageComposeResultCancelled:
            //cancelled
            break;
        case MessageComposeResultFailed:
            //failed
            break;
        case MessageComposeResultSent:
            //sent
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Open Safari

- (IBAction)tappedOpenSafari:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

#pragma mark - Phone Call

- (IBAction)tappedMakePhoneCall:(id)sender{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:+18008008000"]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:18008008000"]];
    }
}

#pragma mark - Send a tweet

- (IBAction)tappedSendTweet:(id)sender{
    SLComposeViewController *socialComposerSheet;
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        socialComposerSheet = [[SLComposeViewController alloc]init];
        socialComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [socialComposerSheet setInitialText:[NSString stringWithFormat:@"My Tweet!"]];
        [self presentViewController:socialComposerSheet animated:YES completion:nil];
    }
    [socialComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultDone:
                //post worked
                break;
            case SLComposeViewControllerResultCancelled:
                //cancelled
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
}
#pragma mark - Post on fb

- (IBAction)tappedSendFacebook:(id)sender{
    SLComposeViewController *socialComposerSheet;
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        socialComposerSheet = [[SLComposeViewController alloc]init];
        socialComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [socialComposerSheet setInitialText:[NSString stringWithFormat:@"My Tweet!"]];
        [self presentViewController:socialComposerSheet animated:YES completion:nil];
    }
    [socialComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultDone:
                //post worked
                break;
            case SLComposeViewControllerResultCancelled:
                //cancelled
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
}

@end
