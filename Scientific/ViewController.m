//
//  ViewController.m
//  Scientific
//
//  Created by Allen Spicer on 4/18/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"


@interface ViewController ()

{
    CalculatorBrain *brain;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

-(IBAction)operandTapped:(UIButton *)sender;
-(IBAction)additionTapped:(UIButton *)sender;
-(IBAction)subtractionTapped:(UIButton *)sender;
-(IBAction)multiplicationTapped:(UIButton *)sender;
-(IBAction)divisionTapped:(UIButton *)sender;
-(IBAction)equalTapped:(UIButton *)sender;
-(IBAction)allClearTapped:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    brain = [[CalculatorBrain alloc]init];
    self.displayLabel.text = @"0";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)operandTapped:(UIButton *)sender{
    if ([self.displayLabel.text isEqualToString:@"0"]) {
            self.displayLabel.text = sender.titleLabel.text;
    }else{
            if ([sender.titleLabel.text isEqualToString: @"."] && [self.displayLabel.text containsString:@"."]){
                }else{
                    if (brain.userIsTyping == YES) {
                        self.displayLabel.text = sender.titleLabel.text;
                        brain = [[CalculatorBrain alloc]init];
                            }else{
                                brain.userIsTyping = NO;
                            self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.titleLabel.text];
                    }
                }
            }
}

-(IBAction)additionTapped:(UIButton *)sender{
    if (!brain){
        brain = [[CalculatorBrain alloc]init];
    }
    //load local instance operator type to addition
    brain.operatorType = OperatorTypeAddition;
    //create a mutable copy of the label text and save it to a local variable
    brain.operand1String = [self.displayLabel.text mutableCopy];
    // convert the local varaible text to a local float variable
    brain.operand1 = [brain.operand1String floatValue];
    
    self.displayLabel.text = @"0";
}

-(IBAction)subtractionTapped:(UIButton *)sender{
    if (!brain){
        brain = [[CalculatorBrain alloc]init];
    }
    brain.operatorType = OperatorTypeSubtraction;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
    self.displayLabel.text = @"0";
}

-(IBAction)multiplicationTapped:(UIButton *)sender{
    if (!brain){
        brain = [[CalculatorBrain alloc]init];
    }
    brain.operatorType = OperatorTypeMultiplication;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
    self.displayLabel.text = @"0";
}


-(IBAction)divisionTapped:(UIButton *)sender{
    if (!brain){
        brain = [[CalculatorBrain alloc]init];
    }
    brain.operatorType = OperatorTypeDivision;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
    self.displayLabel.text = @"0";
}


-(IBAction)equalTapped:(UIButton *)sender{
    
  if((brain.operatorType != OperatorTypeNone)){
      brain.operand2String = [self.displayLabel.text mutableCopy];
      brain.operand2 = [brain.operand2String floatValue];
      
      //set label to be result
      self.displayLabel.text = [brain executeOperationOnOperands];
      
      brain.userIsTyping = YES;
        }else{}
    


}

-(IBAction)allClearTapped:(UIButton *)sender{

    //reset the brain
    brain = [[CalculatorBrain alloc]init];
    //zero field
   self.displayLabel.text = @"0";
}


@end
