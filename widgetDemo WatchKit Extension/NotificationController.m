//
//  NotificationController.m
//  widgetDemo WatchKit Extension
//
//  Created by Yangyue on 15/4/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NotificationController.h"


@interface NotificationController()

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
// Standard remote notification payload keys.
NSString* apsKeyString = @"aps";
NSString* titleKeyString = @"title";

// Payload keys that are specific to the app.
NSString* customDataKey = @"cal";
NSString* invitationDateKey = @"date";
NSString* invitationLocationKey = @"loc";
NSString* invitationNotesKey = @"note";

- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


/*
- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    NSDictionary* apsDict = [remoteNotification objectForKey:apsKeyString];
    
    // Retrieve the title of the invitation.
    NSString* titleString = [apsDict objectForKey:titleKeyString];
    [self.titleLabel setText:titleString];
    
    // Extract the date and time from the custom section of the payload.
    // The date/time information is stored as the number of seconds since 1970.
    NSDictionary* customDataDict = [remoteNotification objectForKey:customDataKey];
    NSNumber* dateValue = [customDataDict objectForKey:invitationDateKey];
    NSDate* inviteDate = [NSDate dateWithTimeIntervalSince1970:[dateValue doubleValue]];
    
    // Format the date and time strings.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Call a custom method to get the localized date format string for the user.
    // The default date format string is "EEE, MMM d".
    dateFormatter.dateFormat = [self dateFormatForCurrentUser];
    NSString *formattedDateString = [dateFormatter stringFromDate:inviteDate];
    
    // Call a custom method to get the localized time format string for the user.
    // The default time format string is "h:mm a".
    dateFormatter.dateFormat = [self timeFormatForCurrentUser];
    NSString *formattedTimeString = [dateFormatter stringFromDate:inviteDate];
    
    // Set the date and time in the corresponding labels.
    [self.dateLabel setText:formattedDateString];
    [self.timeLabel setText:formattedTimeString];
    
    // Set the location of the meeting.
    NSString* locationString = [customDataDict objectForKey:invitationLocationKey];
    [self.locationLabel setText:locationString];
    
    // Set the invitation's notes (if any).
    NSString* notesString = [customDataDict objectForKey:invitationNotesKey];
    [self.notesLabel setText:notesString];
    
    // Tell WatchKit to display the custom interface.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}
*/

@end



