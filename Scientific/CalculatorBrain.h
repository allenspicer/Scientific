//
//  CalculatorBrain.h
//  Scientific
//
//  Created by Allen Spicer on 4/19/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
OperatorTypeNone,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision,
} OperatorType;

@interface CalculatorBrain : NSObject

@property(strong, nonatomic) NSMutableString * operand1String;
@property(strong, nonatomic) NSMutableString * operand2String;

@property(assign) float operand1;
@property(assign) float operand2;
@property(assign) OperatorType operatorType;
@property(assign) BOOL userIsTyping;


-(NSString*) executeOperationOnOperands;

@end
