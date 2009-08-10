/*
 * AppController.j
 * CappApp
 *
 * Created by You on August 9, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    CPTextField widthText;
    CPTextField heightText;
    CPSlider    widthSlider;
    CPSlider    heightSlider;
    CPColorWell topColor;
    CPColorWell bottomColor;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  
  
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
    
    contentView = [theWindow contentView];
        
    // var newWindow = [[CPWindow alloc] initWithContentRect:CGRect(123,123,123,123) styleMask:CPClosableWindowMask];
    // 
    // [contentView addSubview:newWindow];
    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullBridge:YES];
}

- (void)makeGradient:(id)sender
{
  if ([widthText objectValue]) {
    var width = Math.round([widthText objectValue]);
  } else {
    var width = Math.round([widthSlider objectValue]);
  }
  
  if ([heightText objectValue]) {
    var height = Math.round([heightText objectValue]);
  } else {
    var height = Math.round([heightSlider objectValue]);
  }
  
  var tcolor = [topColor color];
  var tHexValue = [tcolor hexString];
  
  var bcolor = [bottomColor color];
  var bHexValue = [bcolor hexString];
  
  var gradientURL = "http://gradient.jpoz.net/" + height + "/" + width + "/" + bHexValue + "/" + tHexValue + "/output.html"
  
  var newWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(20, 20, width + 20, height+ 20) styleMask:CPTitledWindowMask | CPClosableWindowMask ];
  // [newWindow setAutoresizesSubviews:YES];
  var newContentView = [newWindow contentView];
  var bounds = [newContentView bounds];

  var webView = [[CPWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bounds) + 10, CGRectGetHeight(bounds) + 10)];
  [webView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
  [webView setMainFrameURL: gradientURL];
    
  [newContentView addSubview:webView];    
  
  [newWindow orderFront:theWindow];
  
}

@end
