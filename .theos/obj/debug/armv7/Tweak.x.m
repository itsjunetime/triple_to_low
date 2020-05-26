#line 1 "Tweak.x"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBAccessibilityHardwareButtonInteraction; @class CKChatController; @class NSProcessInfo; @class CKComposition; @class SBHardwareButtonInteraction; @class AXSettings; @class SBHomeHardwareButtonActions; @class _CDBatterySaver; 
static void _logos_method$_ungrouped$CKChatController$sendString$(_LOGOS_SELF_TYPE_NORMAL CKChatController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void (*_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions)(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp)(_LOGOS_SELF_TYPE_NORMAL SBAccessibilityHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBAccessibilityHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$AXSettings$assistiveTouchScannerAddedTripleClickAutomatically)(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AXSettings$assistiveTouchScannerAddedTripleClickAutomatically(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$AXSettings$touchAccommodationsTripleClickConfirmed)(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AXSettings$touchAccommodationsTripleClickConfirmed(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSProcessInfo(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSProcessInfo"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CKComposition(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CKComposition"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CKChatController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CKChatController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$_CDBatterySaver(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("_CDBatterySaver"); } return _klass; }
#line 1 "Tweak.x"





 static void _logos_method$_ungrouped$CKChatController$sendString$(_LOGOS_SELF_TYPE_NORMAL CKChatController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * arg1) { static CKChatController *controller;
	NSString *message = arg1.userInfo[@"message"];
	if (!controller) {
		controller = self.delegate.proxyNavigationController.childViewControllers.firstObject;

		if (![controller isKindOfClass:_logos_static_class_lookup$CKChatController()])
			controller = nil;

	}

	CKComposition *composition = [[%c(CKComposition] alloc] initWithText:[[NSAttributedString alloc] initWithString:message] subject:nil]; [controller sendCompositionWithoutThrow:composition inConversation:self.delegate.conversation]; 
}

 



@interface _CDBatterySaver
-(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

@interface CTMessageCenter
+(id)sharedMessageCenter;
-(BOOL)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3;
@end

@interface IMServiceSession
+(id)allServiceSessions;
-(BOOL)sendMessage:(id)arg1 toChat:(id)arg2 style:(unsigned char)arg3;
@end

@interface IMChatRegistry
+(id)sharedInstance;
-(void)_chat:(id)arg1 sendMessage:(id)arg2;
@end

static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[_logos_static_class_lookup$NSProcessInfo() processInfo] isLowPowerModeEnabled]) {
		[[_logos_static_class_lookup$_CDBatterySaver() batterySaver] setPowerMode:0 error:nil];
	} else {
		[[_logos_static_class_lookup$_CDBatterySaver() batterySaver] setPowerMode:1 error:nil];
	}

	NSDictionary *message = @{ @"message": @"This is a test message. Sorry if you didn't expect to receive it, just let me know :)"};
	
	NSNotification *noti = [NSNotification notificationWithName:@"test" object:nil userInfo:message];

	[_logos_static_class_lookup$CKComposition() sendString:noti]; 

}





static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}

static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}

static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}





static BOOL _logos_method$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBAccessibilityHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}



 

static BOOL _logos_method$_ungrouped$AXSettings$assistiveTouchScannerAddedTripleClickAutomatically(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}

static BOOL _logos_method$_ungrouped$AXSettings$touchAccommodationsTripleClickConfirmed(_LOGOS_SELF_TYPE_NORMAL AXSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CKChatController = objc_getClass("CKChatController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CKChatController, @selector(sendString:), (IMP)&_logos_method$_ungrouped$CKChatController$sendString$, _typeEncoding); }Class _logos_class$_ungrouped$SBHomeHardwareButtonActions = objc_getClass("SBHomeHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBHomeHardwareButtonActions, @selector(performTriplePressUpActions), (IMP)&_logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions, (IMP*)&_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions);Class _logos_class$_ungrouped$SBHardwareButtonInteraction = objc_getClass("SBHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeSecondPressDown), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown);MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeDoublePressUp), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp);MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeTriplePressUp), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp);Class _logos_class$_ungrouped$SBAccessibilityHardwareButtonInteraction = objc_getClass("SBAccessibilityHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBAccessibilityHardwareButtonInteraction, @selector(consumeTriplePressUp), (IMP)&_logos_method$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp, (IMP*)&_logos_orig$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp);Class _logos_class$_ungrouped$AXSettings = objc_getClass("AXSettings"); MSHookMessageEx(_logos_class$_ungrouped$AXSettings, @selector(assistiveTouchScannerAddedTripleClickAutomatically), (IMP)&_logos_method$_ungrouped$AXSettings$assistiveTouchScannerAddedTripleClickAutomatically, (IMP*)&_logos_orig$_ungrouped$AXSettings$assistiveTouchScannerAddedTripleClickAutomatically);MSHookMessageEx(_logos_class$_ungrouped$AXSettings, @selector(touchAccommodationsTripleClickConfirmed), (IMP)&_logos_method$_ungrouped$AXSettings$touchAccommodationsTripleClickConfirmed, (IMP*)&_logos_orig$_ungrouped$AXSettings$touchAccommodationsTripleClickConfirmed);} }
#line 96 "Tweak.x"
