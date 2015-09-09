//
//  AppDelegate.m
//  PrefWindowApp2
//
//  Created by Genji on 2015/09/09.
//  Copyright (c) 2015 Genji App. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
  // Insert code here to tear down your application
}


#pragma mark -
#pragma mark Action Method
- (IBAction)showPreferencesWindow:(id)sender
{
  static NSWindowController *preferencesWindowController = nil;
  if(!preferencesWindowController) {
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"PreferencesWindow" bundle:nil];
    preferencesWindowController = [storyboard instantiateInitialController];
  }
  [preferencesWindowController showWindow:nil];
}

@end
