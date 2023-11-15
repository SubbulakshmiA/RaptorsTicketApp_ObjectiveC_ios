//
//  HistoryTableViewController.m
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import "HistoryTableViewController.h"
#import "Store.h"
#import "DetailViewController.h"

@interface HistoryTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *historyTableView;
@property (nonatomic) int rowSelected;

@end

@implementation HistoryTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"History";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"num of row %d",[self.historyStoreObj numOfRowsInPurchaseHistoryList]);
    return [self.historyStoreObj numOfRowsInPurchaseHistoryList];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    myCell.textLabel.text =[self.historyStoreObj accessHistoryItemTitle: (int)(indexPath.row)];
    myCell.detailTextLabel .text = [NSString stringWithFormat:@"%d",[self.historyStoreObj accessHistoryItemQnt: (int)(indexPath.row)]];
    
    return myCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.rowSelected = (int)indexPath.row;
    
    
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *dvc = (DetailViewController*) segue.destinationViewController;
    dvc.detailStoreObj = self.historyStoreObj;
    dvc.rowSelected = self.rowSelected;
    
    
}


@end
