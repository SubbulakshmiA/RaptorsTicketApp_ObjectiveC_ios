//
//  ResetViewController.m
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import "ResetViewController.h"

@interface ResetViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *qntDisplay;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property(nonatomic)int rowSelected ;

@end

@implementation ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    
    //Title
//    self.title=@"Courtside ";
    
    
}


- (IBAction)okBtnPressed:(id)sender {
    int qnt = [self.qntDisplay.text intValue];
    [self.resetStoreObj resetInventoryQuantity:qnt :(self.rowSelected)];
    [self.myPickerView reloadAllComponents];
    
}

- (IBAction)cancelBtnPressed:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)resetBtn:(id)sender {
    double value = [self.qntDisplay.text doubleValue];
    [self.resetStoreObj resetInventoryAmount:value :(self.rowSelected)];
    [self.myPickerView reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 3;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
 
    return [self.resetStoreObj titleForTheSelectedRow:(int)row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        
       self.rowSelected=(int)row;
       self.title = [NSString stringWithFormat:@"%@", [self.resetStoreObj titleToDisplayInLable:(self.rowSelected)]];
    
}

@end
