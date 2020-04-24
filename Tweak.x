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

/*%hook AXSettings //Under AccessibilityUtilities/AccessibilityUtilities-Structs. Use this for adding ops

-(BOOL)assistiveTouchScannerAddedTripleClickAutomatically {
	return TRUE;
}

-(BOOL)touchAccommodationsTripleClickConfirmed {
	return TRUE;
}

%end*/
