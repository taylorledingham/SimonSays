//
//  ViewController.m
//  TLSimonSays
//
//  Created by Taylor Ledingham on 2014-10-15.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentPress;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.userInputs = [[NSMutableArray alloc]init];
    
    self.colors =  @[self.redButton, self.blueButton, self.greenButton, self.orangeButton];
    
    self.roundNumber = 1;
    
    self.currentPress = 0;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)greenButtonPressed:(UIButton *)sender {
    
    [self buttonPressed:sender];
    
}

- (IBAction)orangeButtonPressed:(UIButton *)sender {
    [self buttonPressed:sender];
    
}

- (IBAction)redButtonPressed:(UIButton *)sender {

    [self buttonPressed:sender];

    
}

- (IBAction)blueButtonPressed:(UIButton *)sender {
    
    [self buttonPressed:sender];

    
}

-(void)buttonPressed:(UIButton *)sender {
    
    if(self.currentPress >= self.roundNumber )
    {
        [self userDone];
        
    }
    
    else {
        
        self.currentPress++;
        [self.userInputs addObject:sender];
        [self userDone];
        
        
    }
    
    
}

- (IBAction)startRound:(UIButton *)sender {
    
    [self generatePatternArray];
    [self animatePatternWithArray:[[NSMutableArray alloc]initWithArray:self.pattern]];
    
}

-(void)userDone {
    if(self.currentPress == self.roundNumber){
        //users done
        BOOL correct = [self checkInput];
        //NSLog(@"%@", correct);
        if(correct){
            [self userCorrect];
        }
        
        else {
            
            [self flashAllButtonsWithRepeats:3];
            
            
 

        }
        
    }
    
}

-(void)flashAllButtonsWithRepeats:(int)repeat {
    
    float delay = 0.5;
    float duration = 0.5;
        
        [UIView animateWithDuration: duration
                              delay: delay
                            options: UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAutoreverse
                         animations:^{
                             self.redButton.alpha = 1;
                             self.blueButton.alpha = 1;
                             self.greenButton.alpha = 1;
                             self.orangeButton.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             
                             self.redButton.alpha = 0.5;
                             self.blueButton.alpha = 0.5;
                             self.greenButton.alpha = 0.5;
                             self.orangeButton.alpha = 0.5;
                             

                             [UIView animateWithDuration: duration
                                                    delay: delay
                                                  options: UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAutoreverse
                                               animations:^{
                                                   self.redButton.alpha = 1;
                                                   self.blueButton.alpha = 1;
                                                   self.greenButton.alpha = 1;
                                                   self.orangeButton.alpha = 1;
                                               }
                                               completion:^(BOOL finished) {
                                                   
                                                   self.redButton.alpha = 0.5;
                                                   self.blueButton.alpha = 0.5;
                                                   self.greenButton.alpha = 0.5;
                                                   self.orangeButton.alpha = 0.5;
                                                   
                                                   [UIView animateWithDuration: duration
                                                                          delay: delay
                                                                        options: UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAutoreverse
                                                                     animations:^{
                                                                         self.redButton.alpha = 1;
                                                                         self.blueButton.alpha = 1;
                                                                         self.greenButton.alpha = 1;
                                                                         self.orangeButton.alpha = 1;
                                                                     }
                                                                     completion:^(BOOL finished) {
                                                                         
                                                                         self.redButton.alpha = 0.5;
                                                                         self.blueButton.alpha = 0.5;
                                                                         self.greenButton.alpha = 0.5;
                                                                         self.orangeButton.alpha = 0.5;
                                                                        
                                                                         
                                                                         [self resetGame];
                                                                         [self startRound:nil];
                                                                         
                                                                     }];
                                                            }];
                             
                                                    }];

}



-(void)userCorrect {
    
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.redButton.alpha = 1;
                          self.blueButton.alpha = 1;
                         self.greenButton.alpha = 1;
                          self.orangeButton.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         self.redButton.alpha = 0.5;
                         self.blueButton.alpha = 0.5;
                         self.greenButton.alpha = 0.5;
                         self.orangeButton.alpha = 0.5;
                         
                         [self animateBlocks];
                         
                         
                     }];
 
  
}

-(void)animateBlocks {
    
    [UIView animateWithDuration: 1.0
                          delay: 2.0
                        options: UIViewAnimationOptionTransitionNone
                     animations:^{
                                }
                     completion:^(BOOL finished) {
                         
                         [self resetRound];
                         
                     }];
 
    
}

-(void) resetGame {
    
    self.roundNumber = 1;
    self.currentPress = 0;
    
    [self.userInputs removeAllObjects];
    
    
    
}

-(void)resetRound {
    
    self.roundNumber++;
    self.currentPress = 0;
    
    [self.userInputs removeAllObjects];
    
    [self generatePatternArray];
    
    [self animatePatternWithArray:[[NSMutableArray alloc]initWithArray:self.pattern]];
    
    
}


-(BOOL)checkInput {
    
    if(self.currentPress == self.roundNumber){
        
        for (int i=0; i<self.userInputs.count; i++){
            
            if([self.pattern objectAtIndex:i]!=[self.userInputs objectAtIndex:i]){
                
               // NSLog(@"%@", [self.pattern objectAtIndex:i]);
                //NSLog(@"%@", [self.userInputs objectAtIndex:i]);
                
                return NO;
            }
        }
        
    }
    
    return YES;
}

-(void)generatePatternArray {
    
    int index = self.roundNumber;
    int randomindex = 0;
    NSMutableArray *newPattern = [[NSMutableArray alloc]init];
    
    while (index > 0) {
        
        randomindex = [self getRandomNumberBetween:0 to:(int)(self.colors.count-1)];
        [newPattern addObject:[self.colors objectAtIndex:randomindex]];
        
        index--;
    }
    
    self.pattern = newPattern;
    
}


-(void)animatePatternWithArray:(NSMutableArray *) pattern {
    
    if (pattern.count < 1){
        return;
    }
    
    UIButton *button = [pattern firstObject];
    //[pattern removeObject:button];
    [pattern removeObjectAtIndex:0];
    
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionCrossDissolve  | UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAutoreverse
                     animations:^{
                         button.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         
                         button.alpha = 0.5;
                         [self animatePatternWithArray:pattern];
                         
                     }];

    
    
    
}

#pragma mark - alert View delegate methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == [alertView cancelButtonIndex]){
        self.roundNumber = 0;
        
    }
    
    else {
        [self animatePatternWithArray:[[NSMutableArray alloc]initWithArray:self.pattern]];
        
    }
    
}


#pragma mark - helper methods


-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

@end
