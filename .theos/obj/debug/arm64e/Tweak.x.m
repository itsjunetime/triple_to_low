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

@class SBAccessibilityHardwareButtonInteraction; @class SBHardwareButtonInteraction; @class NSProcessInfo; @class _CDBatterySaver; @class SBHomeHardwareButtonActions; 
static void (*_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions)(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp)(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp)(_LOGOS_SELF_TYPE_NORMAL SBAccessibilityHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp(_LOGOS_SELF_TYPE_NORMAL SBAccessibilityHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSProcessInfo(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSProcessInfo"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$_CDBatterySaver(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("_CDBatterySaver"); } return _klass; }
#line 1 "Tweak.x"


@interface _CDBatterySaver
-(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[_logos_static_class_lookup$NSProcessInfo() processInfo] isLowPowerModeEnabled]) {
		[[_logos_static_class_lookup$_CDBatterySaver() batterySaver] setPowerMode:0 error:nil];
	} else {
		[[_logos_static_class_lookup$_CDBatterySaver() batterySaver] setPowerMode:1 error:nil];
	}
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














static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBHomeHardwareButtonActions = objc_getClass("SBHomeHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBHomeHardwareButtonActions, @selector(performTriplePressUpActions), (IMP)&_logos_method$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions, (IMP*)&_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performTriplePressUpActions);Class _logos_class$_ungrouped$SBHardwareButtonInteraction = objc_getClass("SBHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeSecondPressDown), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeSecondPressDown);MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeDoublePressUp), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeDoublePressUp);MSHookMessageEx(_logos_class$_ungrouped$SBHardwareButtonInteraction, @selector(consumeTriplePressUp), (IMP)&_logos_method$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp, (IMP*)&_logos_orig$_ungrouped$SBHardwareButtonInteraction$consumeTriplePressUp);Class _logos_class$_ungrouped$SBAccessibilityHardwareButtonInteraction = objc_getClass("SBAccessibilityHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBAccessibilityHardwareButtonInteraction, @selector(consumeTriplePressUp), (IMP)&_logos_method$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp, (IMP*)&_logos_orig$_ungrouped$SBAccessibilityHardwareButtonInteraction$consumeTriplePressUp);} }
#line 54 "Tweak.x"
