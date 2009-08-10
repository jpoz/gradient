I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;18;CPPlatformWindow.jc;19829;
var _1="dblclick",_2="mousedown",_3="mouseup",_4="mousemove",_5="mousedrag",_6="keyup",_7="keydown",_8="keypress",_9="copy",_a="paste",_b="resize",_c="mousewheel",_d="touchstart",_e="touchmove",_f="touchend",_10="touchcancel";
var _11=[];
_11["INPUT"]=YES;
_11["SELECT"]=YES;
_11["TEXTAREA"]=YES;
_11["OPTION"]=YES;
var _12,_13;
var _14={},_15={},_16={"8":1,"9":1,"16":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _17=17;
var _18=objj_getClass("CPPlatformWindow");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPlatformWindow\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("_init"),function(_1a,_1b){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
objj_msgSend(_1a,"registerDOMWindow");
objj_msgSend(_1a,"updateFromNativeContentRect");
_charCodes={};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
}
return _1a;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_1c,_1d){
with(_1c){
if(!_DOMWindow){
return objj_msgSend(_1c,"contentRect");
}
var _1e={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_1e.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_1e.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_1e.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_1e.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_1e.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _1e;
}
}),new objj_method(sel_getUid("updateNativeContentOrigin"),function(_1f,_20){
with(_1f){
if(!_DOMWindow){
return;
}
var _21=objj_msgSend(_1f,"contentRect").origin,_22=objj_msgSend(_1f,"nativeContentRect").origin;
_DOMWindow.moveBy(_21.x-_22.x,_21.y-_22.y);
}
}),new objj_method(sel_getUid("updateNativeContentSize"),function(_23,_24){
with(_23){
if(!_DOMWindow){
return;
}
var _25=objj_msgSend(_23,"contentRect").size,_26=objj_msgSend(_23,"nativeContentRect").size;
_DOMWindow.resizeBy(_25.width-_26.width,_25.height-_26.height);
}
}),new objj_method(sel_getUid("orderBack:"),function(_27,_28,_29){
with(_27){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_2a,_2b){
with(_2a){
var _2c=_DOMWindow.document;
_DOMBodyElement=_2c.getElementsByTagName("body")[0];
_DOMBodyElement.webkitTouchCallout="none";
_DOMFocusElement=_2c.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_2c.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
var _2d=objj_msgSend(_2a,"class"),_2e=sel_getUid("resizeEvent:"),_2f=class_getMethodImplementation(_2d,_2e),_30=function(_31){
_2f(_2a,nil,_31);
},_32=sel_getUid("keyEvent:"),_33=class_getMethodImplementation(_2d,_32),_34=function(_35){
_33(_2a,nil,_35);
},_36=sel_getUid("mouseEvent:"),_37=class_getMethodImplementation(_2d,_36),_38=function(_39){
_37(_2a,nil,_39);
},_3a=sel_getUid("scrollEvent:"),_3b=class_getMethodImplementation(_2d,_3a),_3c=function(_3d){
_3b(_2a,nil,_3d);
},_3e=sel_getUid("touchEvent:"),_3f=class_getMethodImplementation(_2d,_3e),_40=function(_41){
_3f(_2a,nil,_41);
};
if(_2c.addEventListener){
_2c.addEventListener("mouseup",_38,NO);
_2c.addEventListener("mousedown",_38,NO);
_2c.addEventListener("mousemove",_38,NO);
_2c.addEventListener("keyup",_34,NO);
_2c.addEventListener("keydown",_34,NO);
_2c.addEventListener("keypress",_34,NO);
_2c.addEventListener("touchstart",_40,NO);
_2c.addEventListener("touchend",_40,NO);
_2c.addEventListener("touchmove",_40,NO);
_2c.addEventListener("touchcancel",_40,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_3c,NO);
_DOMWindow.addEventListener("mousewheel",_3c,NO);
_DOMWindow.addEventListener("resize",_30,NO);
_DOMWindow.addEventListener("beforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEventListener("mouseup",_38,NO);
_2c.removeEventListener("mousedown",_38,NO);
_2c.removeEventListener("mousemove",_38,NO);
_2c.removeEventListener("keyup",_34,NO);
_2c.removeEventListener("keydown",_34,NO);
_2c.removeEventListener("keypress",_34,NO);
_2c.removeEventListener("touchstart",_40,NO);
_2c.removeEventListener("touchend",_40,NO);
_2c.removeEventListener("touchmove",_40,NO);
_DOMWindow.removeEventListener("resize",_30,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_3c,NO);
_DOMWindow.removeEventListener("mousewheel",_3c,NO);
_2a._DOMWindow=nil;
},NO);
}else{
_2c.attachEvent("onmouseup",_38);
_2c.attachEvent("onmousedown",_38);
_2c.attachEvent("onmousemove",_38);
_2c.attachEvent("ondblclick",_38);
_2c.attachEvent("onkeyup",_34);
_2c.attachEvent("onkeydown",_34);
_2c.attachEvent("onkeypress",_34);
_DOMWindow.attachEvent("onresize",_30);
_DOMWindow.onmousewheel=_3c;
_2c.onmousewheel=_3c;
_2c.body.ondrag=function(){
return NO;
};
_2c.body.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onbeforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEvent("onmouseup",_38);
_2c.removeEvent("onmousedown",_38);
_2c.removeEvent("onmousemove",_38);
_2c.removeEvent("ondblclick",_38);
_2c.removeEvent("onkeyup",_34);
_2c.removeEvent("onkeydown",_34);
_2c.removeEvent("onkeypress",_34);
_DOMWindow.removeEvent("onresize",_30);
_DOMWindow.onmousewheel=NULL;
_2c.onmousewheel=NULL;
_2c.body.ondrag=NULL;
_2c.body.onselectstart=NULL;
_2a._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("isVisible"),function(_42,_43){
with(_42){
return _DOMWindow!==NULL;
}
}),new objj_method(sel_getUid("orderFront:"),function(_44,_45,_46){
with(_44){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("","","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
objj_msgSend(_44,"registerDOMWindow");
}
}),new objj_method(sel_getUid("orderOut:"),function(_47,_48,_49){
with(_47){
_DOMWindow.close();
}
}),new objj_method(sel_getUid("keyEvent:"),function(_4a,_4b,_4c){
with(_4a){
var _4d,_4e=_4c.timeStamp?_4c.timeStamp:new Date(),_4f=(_4c.target||_4c.srcElement),_50=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_51=(_4c.shiftKey?CPShiftKeyMask:0)|(_4c.ctrlKey?CPControlKeyMask:0)|(_4c.altKey?CPAlternateKeyMask:0)|(_4c.metaKey?CPCommandKeyMask:0);
if(_11[_4f.tagName]&&_4f!=_DOMFocusElement&&_4f!=_DOMPasteboardElement){
return;
}
StopDOMEventPropagation=!(_51&(CPControlKeyMask|CPCommandKeyMask))||_15[String.fromCharCode(_4c.keyCode||_4c.charCode).toLowerCase()]||_14[_4c.keyCode];
var _52=NO,_53=NO;
switch(_4c.type){
case "keydown":
_keyCode=_4c.keyCode;
var _54=String.fromCharCode(_keyCode).toLowerCase();
if(_54=="v"&&(_51&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_52=YES;
}else{
if((_54=="c"||_54=="x")&&(_51&CPPlatformActionKeyMask)){
_53=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_16[_keyCode]&&(_keyCode==_17||!(_51&CPControlKeyMask))){
return;
}
}
}
}
case "keypress":
if((_4c.target||_4c.srcElement)==_DOMPasteboardElement){
return;
}
var _55=_keyCode,_56=_4c.keyCode||_4c.charCode,_57=(_charCodes[_55]!=nil);
_charCodes[_55]=_56;
var _54=String.fromCharCode(_56),_58=_54.toLowerCase();
_4d=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_51,_4e,_50,nil,_54,_58,_57,_55);
if(_52){
_pasteboardKeyDownEvent=_4d;
window.setNativeTimeout(function(){
objj_msgSend(_4a,"_checkPasteboardElement");
},0);
return;
}
break;
case "keyup":
var _55=_4c.keyCode,_56=_charCodes[_55];
_charCodes[_55]=nil;
var _54=String.fromCharCode(_56),_58=_54.toLowerCase();
if(!(_51&CPShiftKeyMask)){
_54=_58;
}
_4d=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_51,_4e,_50,nil,_54,_58,NO,_55);
break;
}
if(_4d){
_4d._DOMEvent=_4c;
objj_msgSend(CPApp,"sendEvent:",_4d);
if(_53){
var _59=objj_msgSend(CPPasteboard,"generalPasteboard"),_5a=objj_msgSend(_59,"types");
if(_5a.length){
if(objj_msgSend(_5a,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_59,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_59,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_4a,"_clearPasteboardElement");
},0);
}
return;
}
}
if(StopDOMEventPropagation){
_13(_4c,_4a);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_5b,_5c,_5d){
with(_5b){
if(!_5d){
_5d=window.event;
}
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_60=_5d.target;
while(_60.nodeType!==1){
_60=_60.parentNode;
}
if(_60.offsetParent){
do{
x+=_60.offsetLeft;
y+=_60.offsetTop;
}while(_60=_60.offsetParent);
}
var _61={x:(x+((_5d.clientX-8)/15)),y:(y+((_5d.clientY-8)/15))};
}else{
var _61={x:_5d.clientX,y:_5d.clientY};
}
var _62=0,_63=0,_64=0,_65=_5d.timeStamp?_5d.timeStamp:new Date(),_66=(_5d.shiftKey?CPShiftKeyMask:0)|(_5d.ctrlKey?CPControlKeyMask:0)|(_5d.altKey?CPAlternateKeyMask:0)|(_5d.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
var _67=objj_msgSend(_5b,"hitTest:",_61);
if(!_67){
return;
}
var _64=objj_msgSend(_67,"windowNumber");
_61=objj_msgSend(_67,"convertBridgeToBase:",_61);
if(typeof _5d.wheelDeltaX!="undefined"){
_62=_5d.wheelDeltaX/120;
_63=_5d.wheelDeltaY/120;
}else{
if(_5d.wheelDelta){
_63=_5d.wheelDelta/120;
}else{
if(_5d.detail){
_63=-_5d.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_62=-_62;
_63=-_63;
}
var _68=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_61,_66,_65,_64,nil,-1,1,0);
_68._DOMEvent=_5d;
_68._deltaX=_62;
_68._deltaY=_63;
objj_msgSend(CPApp,"sendEvent:",_68);
if(StopDOMEventPropagation){
_13(_5d,_5b);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(_69,"contentRect").size;
objj_msgSend(_69,"updateFromNativeContentRect");
var _6d=_windowLevels,_6e=_windowLayers,_6f=_6d.length;
while(_6f--){
var _70=objj_msgSend(_6e,"objectForKey:",_6d[_6f])._windows,_71=_70.length;
while(_71--){
objj_msgSend(_70[_71],"resizeWithOldPlatformWindowSize:",_6c);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_72,_73,_74){
with(_72){
if(_74.touches&&(_74.touches.length==1||(_74.touches.length==0&&_74.changedTouches.length==1))){
var _75={};
switch(_74.type){
case CPDOMEventTouchStart:
_75.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_75.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_75.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_75.type=CPDOMEventMouseUp;
break;
}
var _76=_74.touches.length?_74.touches[0]:_74.changedTouches[0];
_75.clientX=_76.clientX;
_75.clientY=_76.clientY;
_75.timestamp=_74.timestamp;
_75.target=_74.target;
_75.shiftKey=_75.ctrlKey=_75.altKey=_75.metaKey=false;
_75.preventDefault=function(){
if(_74.preventDefault){
_74.preventDefault();
}
};
_75.stopPropagation=function(){
if(_74.stopPropagation){
_74.stopPropagation();
}
};
objj_msgSend(_72,"_bridgeMouseEvent:",_75);
return;
}else{
if(_74.preventDefault){
_74.preventDefault();
}
if(_74.stopPropagation){
_74.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_77,_78,_79){
with(_77){
var _7a=_overriddenEventType||_79.type;
if(_7a===CPDOMEventDoubleClick){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_77,"_bridgeMouseEvent:",_79);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_77,"_bridgeMouseEvent:",_79);
_overriddenEventType=nil;
return;
}
var _7b,_7c={x:_79.clientX,y:_79.clientY},_7d=_79.timeStamp?_79.timeStamp:new Date(),_7e=(_79.target||_79.srcElement),_7f=0,_80=(_79.shiftKey?CPShiftKeyMask:0)|(_79.ctrlKey?CPControlKeyMask:0)|(_79.altKey?CPAlternateKeyMask:0)|(_79.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
if(_mouseDownWindow){
_7f=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _81=objj_msgSend(_77,"hitTest:",_7c);
if((_79.type===CPDOMEventMouseDown)&&_81){
_mouseDownWindow=_81;
}
_7f=objj_msgSend(_81,"windowNumber");
}
if(_7f){
_7c=objj_msgSend(CPApp._windows[_7f],"convertBridgeToBase:",_7c);
}
if(_7a==="mouseup"){
if(_mouseIsDown){
_7b=_82(_79,CPLeftMouseUp,_7c,_80,_7d,_7f,nil,-1,_12(_lastMouseUp,_7d,_7c),0);
_mouseIsDown=NO;
_lastMouseUp=_7b;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_7a==="mousedown"){
if(_11[_7e.tagName]&&_7e!=_DOMFocusElement){
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_7c,_80,_7d,_7f,nil,-1,_12(_lastMouseDown,_7d,_7c),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_7c,_80,_7d,_7f,nil,-1,_12(_lastMouseDown,_7d,_7c),0));
return;
}
_7b=_82(_79,CPLeftMouseDown,_7c,_80,_7d,_7f,nil,-1,_12(_lastMouseDown,_7d,_7c),0);
_mouseIsDown=YES;
_lastMouseDown=_7b;
}else{
if(_DOMEventMode){
return;
}
_7b=_82(_79,_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_7c,_80,_7d,_7f,nil,-1,1,0);
}
}
if(_7b){
_7b._DOMEvent=_79;
objj_msgSend(CPApp,"sendEvent:",_7b);
}
if(StopDOMEventPropagation){
_13(_79,_77);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_83,_84,_85,_86){
with(_83){
var _87=objj_msgSend(_windowLayers,"objectForKey:",_85);
if(!_87&&_86){
_87=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_85);
objj_msgSend(_windowLayers,"setObject:forKey:",_87,_85);
var low=0,_89=_windowLevels.length-1,_8a;
while(low<=_89){
_8a=FLOOR((low+_89)/2);
if(_windowLevels[_8a]>_85){
_89=_8a-1;
}else{
low=_8a+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_85,_windowLevels[_8a]>_85?_8a:_8a+1);
_87._DOMElement.style.zIndex=_85;
_DOMBodyElement.appendChild(_87._DOMElement);
}
return _87;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_8b,_8c,_8d,_8e,_8f){
with(_8b){
var _90=objj_msgSend(_8b,"layerAtLevel:create:",objj_msgSend(_8e,"level"),_8d!=CPWindowOut);
if(_8d==CPWindowOut){
return objj_msgSend(_90,"removeWindow:",_8e);
}
objj_msgSend(_90,"insertWindow:atIndex:",_8e,(_8f?(_8d==CPWindowAbove?_8f._index+1:_8f._index):CPNotFound));
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_91,_92,_93,_94){
with(_91){
var _95=_windowLevels,_96=_windowLayers,_97=_95.length;
while(_97--){
if(_95[_97]>=CPDraggingWindowLevel){
continue;
}
var _98=objj_msgSend(_96,"objectForKey:",_95[_97])._windows,_99=_98.length;
while(_99--){
var _9a=_98[_99];
if(objj_msgSend(_9a,"containsPoint:",_93)){
return objj_msgSend(_9a,"_dragHitTest:pasteboard:",_93,_94);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_9b,_9c,_9d){
with(_9b){
StopDOMEventPropagation=!_9d;
}
}),new objj_method(sel_getUid("hitTest:"),function(_9e,_9f,_a0){
with(_9e){
var _a1=_windowLevels,_a2=_windowLayers,_a3=_a1.length,_a4=nil;
while(_a3--&&!_a4){
var _a5=objj_msgSend(_a2,"objectForKey:",_a1[_a3])._windows,_a6=_a5.length;
while(_a6--&&!_a4){
var _a7=_a5[_a6];
if(!_a7._ignoresMouseEvents&&objj_msgSend(_a7,"containsPoint:",_a0)){
_a4=_a7;
}
}
}
return _a4;
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_a8,_a9){
with(_a8){
var _aa=_DOMPasteboardElement.value;
if(objj_msgSend(_aa,"length")){
var _ab=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_ab,"_stateUID")!=_aa){
objj_msgSend(_ab,"declareTypes:owner:",[CPStringPboardType],_a8);
objj_msgSend(_ab,"setString:forType:",_aa,CPStringPboardType);
}
}
objj_msgSend(_a8,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_ac,_ad){
with(_ac){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_ae,_af,_b0){
with(_ae){
for(var i=_b0.length;i>0;i--){
_15[""+_b0[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_b2,_b3,_b4){
with(_b2){
_15[_b4.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_b5,_b6){
with(_b5){
_15={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_b7,_b8,_b9){
with(_b7){
for(var i=_b9.length;i>0;i--){
_14[_b9[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_bb,_bc,_bd){
with(_bb){
_14[_bd]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_be,_bf){
with(_be){
_14={};
}
})]);
var _c0=objj_msgSend(CPEvent,"class");
var _82=function(_c1,_c2,_c3,_c4,_c5,_c6,_c7,_c8,_c9,_ca){
_c1.isa=_c0;
_c1._type=_c2;
_c1._location=_c3;
_c1._modifierFlags=_c4;
_c1._timestamp=_c5;
_c1._windowNumber=_c6;
_c1._window=nil;
_c1._context=_c7;
_c1._eventNumber=_c8;
_c1._clickCount=_c9;
_c1._pressure=_ca;
return _c1;
};
var _cb=5,_cc=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _12=function(_cd,_ce,_cf){
if(!_cd){
return 1;
}
var _d0=objj_msgSend(_cd,"locationInWindow");
return (_ce-objj_msgSend(_cd,"timestamp")<_cc&&ABS(_d0.x-_cf.x)<_cb&&ABS(_d0.y-_cf.y)<_cb)?objj_msgSend(_cd,"clickCount")+1:1;
};
var _13=function(_d1,_d2){
_d1.cancelBubble=true;
_d1.returnValue=false;
if(_d1.preventDefault){
_d1.preventDefault();
}
if(_d1.stopPropagation){
_d1.stopPropagation();
}
if(_d1.type===CPDOMEventMouseDown){
_d2._DOMFocusElement.focus();
_d2._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _d3=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_d4=_d3._windowLevels,_d5=_d3._windowLayers,_d6=_d4.length,_d7=[];
while(_d6--){
var _d8=objj_msgSend(_d5,"objectForKey:",_d4[_d6])._windows,_d9=_d8.length;
while(_d9--){
_d7.push(_d8[_d9]);
}
}
return _d7;
};
CPWindowList=function(){
var _da=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_db=_da._windowLevels,_dc=_da._windowLayers,_dd=_db.length,_de=[];
while(_dd--){
var _df=objj_msgSend(_dc,"objectForKey:",_db[_dd])._windows,_e0=_df.length;
while(_e0--){
_de.push(objj_msgSend(_df[_e0],"windowNumber"));
}
}
return _de;
};
