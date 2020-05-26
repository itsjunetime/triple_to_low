%hook CKChatController

//@property (nonatomic) <CKNavbarCanvasViewControllerDelegate> *delegate;
//@property (nonatomic) UINavigationController *proxyNavigationController;

%new -(void)sendString:(NSNotification *)arg1 { static CKChatController *controller;
	NSString *message = arg1.userInfo[@"message"];
	if (!controller) {
		controller = self.delegate.proxyNavigationController.childViewControllers.firstObject;

		if (![controller isKindOfClass:%c(CKChatController)])
			controller = nil;

	}

	CKComposition *composition = [[%c(CKComposition] alloc] initWithText:[[NSAttributedString alloc] initWithString:message] subject:nil]; [controller sendCompositionWithoutThrow:composition inConversation:self.delegate.conversation]; 
}

%end 

%hook SBHomeHardwareButtonActions

@interface _CDBatterySaver
-(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

-(void)performTriplePressUpActions {
	if ([[%c(NSProcessInfo) processInfo] isLowPowerModeEnabled]) {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:0 error:nil];
	} else {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:1 error:nil];
	}

	NSDictionary *message = @{ @"message": @"This is a test message. Sorry if you didn't expect to receive it, just let me know :)"};
	
	NSNotification *noti = [NSNotification notificationWithName:@"test" object:nil userInfo:message];

	[%c(CKComposition) sendString:noti]; 

}

%end

%hook SBHardwareButtonInteraction

-(BOOL)consumeSecondPressDown {
    return NO;
}

-(BOOL)consumeDoublePressUp {
    return NO;
}

-(BOOL)consumeTriplePressUp {
    return YES;
}

%end

%hook SBAccessibilityHardwareButtonInteraction

-(BOOL)consumeTriplePressUp {
    return YES;
}

%end

%hook AXSettings //Under AccessibilityUtilities/AccessibilityUtilities-Structs. Use this for adding ops

-(BOOL)assistiveTouchScannerAddedTripleClickAutomatically {
	return YES;
}

-(BOOL)touchAccommodationsTripleClickConfirmed {
	return YES;
}

%end

