i;9;CPEvent.jc;3095;
CPUnknownBrowserEngine=0;
CPGeckoBrowserEngine=1;
CPInternetExplorerBrowserEngine=2;
CPKHTMLBrowserEngine=3;
CPOperaBrowserEngine=4;
CPWebKitBrowserEngine=5;
CPCSSRGBAFeature=1<<5;
CPHTMLCanvasFeature=1<<6;
CPHTMLContentEditableFeature=1<<7;
CPJavascriptInnerTextFeature=1<<8;
CPJavascriptTextContentFeature=1<<9;
CPJavascriptClipboardEventsFeature=1<<10;
CPJavascriptClipboardAccessFeature=1<<11;
CPJavaScriptCanvasDrawFeature=1<<12;
CPJavaScriptCanvasTransformFeature=1<<13;
CPVMLFeature=1<<14;
CPJavascriptRemedialKeySupport=1<<15;
CPJavaScriptShadowFeature=1<<20;
CPJavaScriptNegativeMouseWheelValues=1<<22;
CPJavaScriptMouseWheelValues_8_15=1<<23;
CPOpacityRequiresFilterFeature=1<<24;
CPInputTypeCanBeChangedFeature=1<<25;
var _1="",_2=CPUnknownBrowserEngine,_3=0;
_3|=CPInputTypeCanBeChangedFeature;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
_1=window.navigator.userAgent;
}
if(window.opera){
_2=CPOperaBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
}else{
if(window.attachEvent){
_2=CPInternetExplorerBrowserEngine;
_3|=CPVMLFeature;
_3|=CPJavascriptRemedialKeySupport;
_3|=CPJavaScriptShadowFeature;
_3|=CPOpacityRequiresFilterFeature;
_3&=~CPInputTypeCanBeChangedFeature;
}else{
if(_1.indexOf("AppleWebKit/")!=-1){
_2=CPWebKitBrowserEngine;
_3|=CPCSSRGBAFeature;
_3|=CPHTMLContentEditableFeature;
_3|=CPJavascriptClipboardEventsFeature;
_3|=CPJavascriptClipboardAccessFeature;
_3|=CPJavaScriptShadowFeature;
var _4=_1.indexOf("AppleWebKit/")+"AppleWebKit/".length,_5=_1.indexOf(" ",_4),_6=_1.substring(_4,_5),_7=_6.indexOf("."),_8=parseInt(_6.substring(0,_7)),_9=parseInt(_6.substr(_7+1));
if((_1.indexOf("Safari")!==CPNotFound&&(_8>=525&&_9>14))||_1.indexOf("Chrome")!==CPNotFound){
_3|=CPJavascriptRemedialKeySupport;
}
}else{
if(_1.indexOf("KHTML")!=-1){
_2=CPKHTMLBrowserEngine;
}else{
if(_1.indexOf("Gecko")!==-1){
_2=CPGeckoBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
var _a=_1.indexOf("Firefox"),_b=(_a===-1)?2:parseFloat(_1.substring(_a+"Firefox".length+1));
if(_b>=3){
_3|=CPCSSRGBAFeature;
}
if(_b<3){
_3|=CPJavaScriptMouseWheelValues_8_15;
}
}
}
}
}
}
if(typeof document!="undefined"){
var _c=document.createElement("canvas");
if(_c&&_c.getContext){
_3|=CPHTMLCanvasFeature;
var _d=document.createElement("canvas").getContext("2d");
if(_d&&_d.setTransform&&_d.transform){
_3|=CPJavaScriptCanvasTransformFeature;
}
}
var _e=document.createElement("div");
if(_e.innerText!=undefined){
_3|=CPJavascriptInnerTextFeature;
}else{
if(_e.textContent!=undefined){
_3|=CPJavascriptTextContentFeature;
}
}
}
CPFeatureIsCompatible=function(_f){
return _3&_f;
};
CPBrowserIsEngine=function(_10){
return _2==_10;
};
if(_1.indexOf("Mac")!=-1){
CPPlatformActionKeyMask=CPCommandKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Z";
CPUndoKeyEquivalentModifierMask=CPCommandKeyMask;
CPRedoKeyEquivalentModifierMask=CPCommandKeyMask|CPShiftKeyMask;
}else{
CPPlatformActionKeyMask=CPControlKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Y";
CPUndoKeyEquivalentModifierMask=CPControlKeyMask;
CPRedoKeyEquivalentModifierMask=CPControlKeyMask;
}
