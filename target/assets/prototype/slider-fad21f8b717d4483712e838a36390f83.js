//# sourceMappingURL=slider.js.map
if(!Control)var Control={};
Control.Slider=Class.create({initialize:function(a,b,c){var d=this;Object.isArray(a)?this.handles=a.collect(function(a){return $(a)}):this.handles=[$(a)];this.track=$(b);this.options=c||{};this.axis=this.options.axis||"horizontal";this.increment=this.options.increment||1;this.step=parseInt(this.options.step||"1");this.range=this.options.range||$R(0,1);this.value=0;this.values=this.handles.map(function(){return 0});this.spans=this.options.spans?this.options.spans.map(function(a){return $(a)}):!1;this.options.startSpan=
$(this.options.startSpan||null);this.options.endSpan=$(this.options.endSpan||null);this.restricted=this.options.restricted||!1;this.maximum=this.options.maximum||this.range.end;this.minimum=this.options.minimum||this.range.start;this.alignX=parseInt(this.options.alignX||"0");this.alignY=parseInt(this.options.alignY||"0");this.trackLength=this.maximumOffset()-this.minimumOffset();this.handleLength=this.isVertical()?0!=this.handles[0].offsetHeight?this.handles[0].offsetHeight:this.handles[0].style.height.replace(/px$/,
""):0!=this.handles[0].offsetWidth?this.handles[0].offsetWidth:this.handles[0].style.width.replace(/px$/,"");this.disabled=this.dragging=this.active=!1;this.options.disabled&&this.setDisabled();if(this.allowedValues=this.options.values?this.options.values.sortBy(Prototype.K):!1)this.minimum=this.allowedValues.min(),this.maximum=this.allowedValues.max();this.eventMouseDown=this.startDrag.bindAsEventListener(this);this.eventMouseUp=this.endDrag.bindAsEventListener(this);this.eventMouseMove=this.update.bindAsEventListener(this);
this.handles.each(function(a,b){b=d.handles.length-1-b;d.setValue(parseFloat((Object.isArray(d.options.sliderValue)?d.options.sliderValue[b]:d.options.sliderValue)||d.range.start),b);a.makePositioned().observe("mousedown",d.eventMouseDown)});this.track.observe("mousedown",this.eventMouseDown);document.observe("mouseup",this.eventMouseUp);document.observe("mousemove",this.eventMouseMove);this.initialized=!0},dispose:function(){var a=this;Event.stopObserving(this.track,"mousedown",this.eventMouseDown);
Event.stopObserving(document,"mouseup",this.eventMouseUp);Event.stopObserving(document,"mousemove",this.eventMouseMove);this.handles.each(function(b){Event.stopObserving(b,"mousedown",a.eventMouseDown)})},setDisabled:function(){this.disabled=!0},setEnabled:function(){this.disabled=!1},getNearestValue:function(a){if(this.allowedValues){if(a>=this.allowedValues.max())return this.allowedValues.max();if(a<=this.allowedValues.min())return this.allowedValues.min();var b=Math.abs(this.allowedValues[0]-a),
c=this.allowedValues[0];this.allowedValues.each(function(d){var e=Math.abs(d-a);e<=b&&(c=d,b=e)});return c}return a>this.range.end?this.range.end:a<this.range.start?this.range.start:a},setValue:function(a,b){this.active||(this.activeHandleIdx=b||0,this.activeHandle=this.handles[this.activeHandleIdx],this.updateStyles());b=b||this.activeHandleIdx||0;this.initialized&&this.restricted&&(0<b&&a<this.values[b-1]&&(a=this.values[b-1]),b<this.handles.length-1&&a>this.values[b+1]&&(a=this.values[b+1]));a=
this.getNearestValue(a);this.values[b]=a;this.value=this.values[0];this.handles[b].style[this.isVertical()?"top":"left"]=this.translateToPx(a);this.drawSpans();this.dragging&&this.event||this.updateFinished()},setValueBy:function(a,b){this.setValue(this.values[b||this.activeHandleIdx||0]+a,b||this.activeHandleIdx||0)},translateToPx:function(a){return Math.round((this.trackLength-this.handleLength)/(this.range.end-this.range.start)*(a-this.range.start))+"px"},translateToValue:function(a){return a/
(this.trackLength-this.handleLength)*(this.range.end-this.range.start)+this.range.start},getRange:function(a){var b=this.values.sortBy(Prototype.K);a=a||0;return $R(b[a],b[a+1])},minimumOffset:function(){return this.isVertical()?this.alignY:this.alignX},maximumOffset:function(){return this.isVertical()?(0!=this.track.offsetHeight?this.track.offsetHeight:this.track.style.height.replace(/px$/,""))-this.alignY:(0!=this.track.offsetWidth?this.track.offsetWidth:this.track.style.width.replace(/px$/,""))-
this.alignX},isVertical:function(){return"vertical"==this.axis},drawSpans:function(){var a=this;this.spans&&$R(0,this.spans.length-1).each(function(b){a.setSpan(a.spans[b],a.getRange(b))});this.options.startSpan&&this.setSpan(this.options.startSpan,$R(0,1<this.values.length?this.getRange(0).min():this.value));this.options.endSpan&&this.setSpan(this.options.endSpan,$R(1<this.values.length?this.getRange(this.spans.length-1).max():this.value,this.maximum))},setSpan:function(a,b){this.isVertical()?(a.style.top=
this.translateToPx(b.start),a.style.height=this.translateToPx(b.end-b.start+this.range.start)):(a.style.left=this.translateToPx(b.start),a.style.width=this.translateToPx(b.end-b.start+this.range.start))},updateStyles:function(){this.handles.each(function(a){Element.removeClassName(a,"selected")});Element.addClassName(this.activeHandle,"selected")},startDrag:function(a){if(Event.isLeftClick(a)){if(!this.disabled){this.active=!0;var b=Event.element(a),c=[Event.pointerX(a),Event.pointerY(a)];if(b==this.track)b=
this.track.cumulativeOffset(),this.event=a,this.setValue(this.translateToValue((this.isVertical()?c[1]-b[1]:c[0]-b[0])-this.handleLength/2)),b=this.activeHandle.cumulativeOffset(),this.offsetX=c[0]-b[0],this.offsetY=c[1]-b[1];else{for(;-1==this.handles.indexOf(b)&&b.parentNode;)b=b.parentNode;-1!=this.handles.indexOf(b)&&(this.activeHandle=b,this.activeHandleIdx=this.handles.indexOf(this.activeHandle),this.updateStyles(),b=this.activeHandle.cumulativeOffset(),this.offsetX=c[0]-b[0],this.offsetY=c[1]-
b[1])}}Event.stop(a)}},update:function(a){this.active&&(this.dragging||(this.dragging=!0),this.draw(a),Prototype.Browser.WebKit&&window.scrollBy(0,0),Event.stop(a))},draw:function(a){var b=[Event.pointerX(a),Event.pointerY(a)],c=this.track.cumulativeOffset();b[0]-=this.offsetX+c[0];b[1]-=this.offsetY+c[1];this.event=a;this.setValue(this.translateToValue(this.isVertical()?b[1]:b[0]));if(this.initialized&&this.options.onSlide)this.options.onSlide(1<this.values.length?this.values:this.value,this)},endDrag:function(a){this.active&&
this.dragging&&(this.finishDrag(a,!0),Event.stop(a));this.dragging=this.active=!1},finishDrag:function(a,b){this.dragging=this.active=!1;this.updateFinished()},updateFinished:function(){if(this.initialized&&this.options.onChange)this.options.onChange(1<this.values.length?this.values:this.value,this);this.event=null}});