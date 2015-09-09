//
//  PreferencesWindow.m
//  PrefWindowApp2
//
//  Created by Genji on 2015/09/09.
//  Copyright (c) 2015 Genji App. All rights reserved.
//

#import "PreferencesWindow.h"

@implementation PreferencesWindow

- (void)cancelOperation:(id)sender
{
  [self close];
}

- (BOOL)validateUserInterfaceItem:(id<NSValidatedUserInterfaceItem>)anItem
{
  if([anItem action] == @selector(toggleToolbarShown:)) {
    return NO;
  }

  return [super validateUserInterfaceItem:anItem];
}

@end