//
//  TextInputViewController.m
//  GDRMMobile
//
//  Created by yu hongwu on 12-7-12.
//  Copyright (c) 2012年 中交宇科 . All rights reserved.
//

#import "TextInputViewController.h"

@interface TextInputViewController ()

@end

@implementation TextInputViewController
@synthesize textInput = _textInput;
@synthesize textFontSize = _textFontSize;
@synthesize delegate=_delegate;
@synthesize rectPresentFrom=_rectPresentFrom;
@synthesize popover=_popover;




- (void)viewDidUnload
{
    [self setTextInput:nil];
    [self setTextFontSize:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{
    if(self.ABCorNUMstring.length >0){
        self.textInput.text = self.ABCorNUMstring;
        [self.textInput setEnabled:NO];
        self.textInput.backgroundColor = [UIColor lightGrayColor];
    }
    self.view.alpha=0.0;
    [UIView animateWithDuration:0.5 
                          delay:0.0 
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{ 
                         self.view.alpha=1.0;
                         self.textFontSize.text = @"21";
                     } 
                     completion:nil];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)btnAddText:(id)sender {
    if (![self.textInput.text isEmpty]){
        [self.delegate inputString:self.textInput.text fontSize:self.textFontSize.text.floatValue inRect:self.rectPresentFrom];
    }
}    

- (IBAction)btnCancel:(id)sender {
    [self.popover dismissPopoverAnimated:YES];
}
@end
