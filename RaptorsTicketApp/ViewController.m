//
//  ViewController.m
//  RaptorsTicketApp
//
//  Created by user248645 on 9/28/23.
//

#import "ViewController.h"
#import "Items.h"
#import "Store.h"
#import "ManagerPanelViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *myDisplay;
@property (weak, nonatomic) IBOutlet UILabel *quantityDisplay;
@property (weak, nonatomic) IBOutlet UILabel *typeDisplay;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property(nonatomic)Items *itemObj;
@property(nonatomic)Store *storeObj;
@property(nonatomic)bool isNewNumber ;
@property(nonatomic)int rowSelected ;
@property (weak, nonatomic) IBOutlet UILabel *updatedQntDisplay;


@end

@implementation ViewController


-(Store*)storeObj{
    if(_storeObj == nil){
        _storeObj = [[Store alloc]init];
    }
    return _storeObj;
}



- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)buyButton:(id)sender {
    [self.storeObj updateQnt:self.rowSelected :([self.quantityDisplay.text intValue])];

    if( self.storeObj.checkQnt){
        [self.pickerView reloadAllComponents];
        self.updatedQntDisplay.text = @"Purchase Sucessful";
        double tc = [self.storeObj totalCost:self.rowSelected :([self.quantityDisplay.text intValue])];
        [self.storeObj addingIntoPurchaseHistory:self.rowSelected withQuantity:([self.quantityDisplay.text intValue])];
        self.myDisplay.text = [NSString stringWithFormat:@"%.2f",tc];
       
    }else{
        self.updatedQntDisplay.text = @"Choose Less Tickets";
    }
   self.isNewNumber = YES;
    
}

- (IBAction)btnPressed:(UIButton *)sender{
    
    if(self.isNewNumber){
        self.quantityDisplay.text =sender.titleLabel.text;
            self.isNewNumber = NO;
        }else{
            self.quantityDisplay.text = [NSString stringWithFormat:@"%@%@", self.quantityDisplay.text,sender.titleLabel.text ];
        }
        NSLog(@"btnpressed");
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return 3;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
 
    return [self.storeObj titleForTheSelectedRow:(int)row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        
    self.rowSelected=(int)row;

    self.typeDisplay.text = [self.storeObj titleToDisplayInLable:(int)row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ManagerPanelViewController *mpVc = (ManagerPanelViewController*) segue.destinationViewController;
    mpVc.managerStoreObj = self.storeObj;
    
}


@end
