//
//  ManagerPanelViewController.m
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import "ManagerPanelViewController.h"
#import "HistoryTableViewController.h"
#import "ResetViewController.h"

@interface ManagerPanelViewController ()

@end

@implementation ManagerPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Title
    
    self.title = @"Manager Panel";
 
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"history"]){
        
        HistoryTableViewController *htVc = (HistoryTableViewController*) segue.destinationViewController;
        
        htVc.historyStoreObj = self.managerStoreObj;

    }else if([segue.identifier isEqualToString:@"reset"]){
        ResetViewController *rvc =(ResetViewController*) segue.destinationViewController;
        
        rvc.resetStoreObj = self.managerStoreObj;
        
    }else{
        NSLog(@"invalid segue identifier");
    }
       
}


@end
