//
//  ViewController.h
//  TLSimonSays
//
//  Created by Taylor Ledingham on 2014-10-15.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, strong) NSMutableArray *userInputs;
@property (nonatomic, strong) NSArray *pattern;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) int roundNumber;


@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;

@property (strong, nonatomic) IBOutlet UIButton *blueButton;
@property (strong, nonatomic) IBOutlet UIButton *redButton;


- (IBAction)greenButtonPressed:(UIButton *)sender;
- (IBAction)orangeButtonPressed:(UIButton *)sender;
- (IBAction)redButtonPressed:(UIButton *)sender;
- (IBAction)blueButtonPressed:(UIButton *)sender;


- (IBAction)startRound:(UIButton *)sender;


@end

