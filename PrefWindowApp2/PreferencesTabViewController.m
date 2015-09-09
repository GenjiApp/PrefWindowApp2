//
//  PreferencesTabViewController.m
//  PrefWindowApp2
//
//  Created by Genji on 2015/09/09.
//  Copyright (c) 2015 Genji App. All rights reserved.
//

#import "PreferencesTabViewController.h"

@interface PreferencesTabViewController ()

@end

@implementation PreferencesTabViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)awakeFromNib
{
  NSTabViewItem *tabViewItem = self.tabView.selectedTabViewItem;
  self.view.window.title = tabViewItem.viewController.title;
}


#pragma mark -
#pragma mark NSTabViewDelegate Method
- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(NSTabViewItem *)tabViewItem
{
  [super tabView:tabView didSelectTabViewItem:tabViewItem];

  tabView.hidden = YES;

  NSWindow *window = self.view.window;
  window.title = tabViewItem.viewController.title;

  NSRect viewFrame = tabViewItem.view.frame;
  viewFrame.size = tabViewItem.view.fittingSize;

  NSArray *constraints = tabViewItem.view.constraints;
  [tabViewItem.view removeConstraints:constraints];

  NSRect windowFrame = [window frameRectForContentRect:viewFrame];
  windowFrame.origin = NSMakePoint(window.frame.origin.x, NSMaxY(window.frame) - NSHeight(windowFrame));

  [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
    [[window animator] setFrame:windowFrame display:YES];
  } completionHandler:^{
    [tabViewItem.view addConstraints:constraints];
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
      [[tabView animator] setHidden:NO];
    } completionHandler:NULL];
  }];
}

@end
