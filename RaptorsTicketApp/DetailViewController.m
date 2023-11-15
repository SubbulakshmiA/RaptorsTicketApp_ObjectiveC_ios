//
//  DetailViewController.m
//  RaptorsTicketApp
//
//  Created by user243757 on 9/30/23.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *itemDisplay;
@property (weak, nonatomic) IBOutlet UILabel *qntDisplay;
@property (weak, nonatomic) IBOutlet UILabel *costDisplay;
@property (weak, nonatomic) IBOutlet UILabel *dateDisplay;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Purchase Details";
    
    
    self.itemDisplay.text = [self.detailStoreObj accessHistoryItemTitle:(self.rowSelected)];
    self.qntDisplay.text = [NSString stringWithFormat:@"%d",[self.detailStoreObj accessHistoryItemQnt:(self.rowSelected)]];
    self.costDisplay.text = [NSString stringWithFormat:@"%.2f",[self.detailStoreObj accessHistoryItemCost:(self.rowSelected)]];
    self.dateDisplay.text = [NSString stringWithFormat:@"%@",[self.detailStoreObj accessHistoryItemDate:(self.rowSelected)]];
    // Do any additional setup after loading the view.
}



@end
