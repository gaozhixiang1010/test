/**
 * @author ZhangHuihua@msn.com
 */
$.setRegional("alertMsg", {
	title:{error:"Error", info:"Information", warn:"Warning", correct:"Successful", confirm:"Confirmation"},
	butMsg:{ok:"OK", yes:"Yes", no:"No", cancel:"Cancel"}
});
var alertMsg = {
	_boxId: "#alertMsgBox",
	_bgId: "#alertBackground",
	_closeTimer: null,

	_types: {error:"error", info:"info", warn:"warn", correct:"correct", confirm:"confirm"},

	_getTitle: function(key){
		return $.regional.alertMsg.title[key];
	},

	_keydownOk: function(event){
		if (event.keyCode == DWZ.keyCode.ENTER) event.data.target.trigger("click");
		return false;
	},
	_keydownEsc: function(event){
		if (event.keyCode == DWZ.keyCode.ESC) event.data.target.trigger("click");
	},
	/**
	 * 
	 * @param {Object} type
	 * @param {Object} msg
	 * @param {Object} buttons [button1, button2]
	 */
	_open: function(type, msg, buttons){
		$(this._boxId).remove();
		var butsHtml = "";
		if (buttons) {
			for (var i = 0; i < buttons.length; i++) {
				var sRel = buttons[i].call ? "callback" : "";
				butsHtml += DWZ.frag["alertButFrag"].replace("#butMsg#", buttons[i].name).replace("#callback#", sRel);
			}
		}
		var boxHtml = DWZ.frag["alertBoxFrag"].replace("#type#", type).replace("#title#", this._getTitle(type)).replace("#message#", msg).replace("#butFragment#", butsHtml);
		$(boxHtml).appendTo("body").css({top:-$(this._boxId).height()+"px"}).animate({top:"300px"}, 0);
		
		if (this._closeTimer) {
			clearTimeout(this._closeTimer);
			this._closeTimer = null;
		}
		if (this._types.info == type || this._types.correct == type){
			this._closeTimer = setTimeout(function(){alertMsg.close()}, 3500);
		} else {
			$(this._bgId).show();
		}
		
		//用于屏蔽点击回车，触发click事件，再次打开alert
		$('<input type="text" style="width:0;height:0;" name="_alertFocusCtr"/>').appendTo(this._boxId).focus().hide();
		
		var jButs = $(this._boxId).find("a.button");
		var jCallButs = jButs.filter("[rel=callback]");
		var jDoc = $(document);
		
		for (var i = 0; i < buttons.length; i++) {
			if (buttons[i].call) 
			{
			  jCallButs.eq(i).click(buttons[i].call);
			}
			if (buttons[i].keyCode == DWZ.keyCode.ENTER) {
				jDoc.bind("keydown",{target:jButs.eq(i)}, this._keydownOk);
			}
			if (buttons[i].keyCode == DWZ.keyCode.ESC) {
				jDoc.bind("keydown",{target:jButs.eq(i)}, this._keydownEsc);
			}
		}
		for(var j =0;j<jButs.length;j++)
		{
		  jButs.eq(j).click(function(){alertMsg.close();});
		}
		
	},
	close: function(){
		$(document).unbind("keydown", this._keydownOk).unbind("keydown", this._keydownEsc);
		$(this._boxId).animate({top:-$(this._boxId).height()}, 0, function(){
			$(this).remove();
		});
		$(this._bgId).hide();
	},
	error: function(msg, options) {
		$(this._boxId).remove();
		var butsHtml = "";
		var boxHtml = DWZ.frag["alertErrorFrag"].replace("#message#", msg);
		$(boxHtml).appendTo("body").css({top:-$(this._boxId).height()+"px"}).animate({top:"300px"}, 0);
		
		if (this._closeTimer) {
			clearTimeout(this._closeTimer);
			this._closeTimer = null;
		}
		this._closeTimer = setTimeout(function(){alertMsg.close()}, 2000);
		//用于屏蔽点击回车，触发click事件，再次打开alert
		$('<input type="text" style="width:0;height:0;" name="_alertFocusCtr"/>').appendTo(this._boxId).focus().hide();

		var jDoc = $(document);
		//this._alert(this._types.error, msg, options);
	},
	info: function(msg, options) 
	{
		$(this._boxId).remove();
		var butsHtml = "";
		var boxHtml = DWZ.frag["alertInfoFrag"].replace("#message#", msg);
		$(boxHtml).appendTo("body").css({top:-$(this._boxId).height()+"px"}).animate({top:"300px"}, 0);
		
		if (this._closeTimer) {
			clearTimeout(this._closeTimer);
			this._closeTimer = null;
		}
		this._closeTimer = setTimeout(function(){alertMsg.close()}, 2000);
		//用于屏蔽点击回车，触发click事件，再次打开alert
		$('<input type="text" style="width:0;height:0;" name="_alertFocusCtr"/>').appendTo(this._boxId).focus().hide();
		var jDoc = $(document);
		
	},
	warn: function(msg, options) {
		$(this._boxId).remove();
		var butsHtml = "";
		var boxHtml = DWZ.frag["alertWarnFrag"].replace("#message#", msg);
		$(boxHtml).appendTo("body").css({top:-$(this._boxId).height()+"px"}).animate({top:"300px"}, 0);
		
		if (this._closeTimer) {
			clearTimeout(this._closeTimer);
			this._closeTimer = null;
		}
		this._closeTimer = setTimeout(function(){alertMsg.close()}, 2000);
		//用于屏蔽点击回车，触发click事件，再次打开alert
		$('<input type="text" style="width:0;height:0;" name="_alertFocusCtr"/>').appendTo(this._boxId).focus().hide();

		var jDoc = $(document);
		//this._alert(this._types.warn, msg, options);
	},
	correct: function(msg, options) {
		this._alert(this._types.correct, msg, options);
	},
	_alert: function(type, msg, options) {
		var op = {okName:$.regional.alertMsg.butMsg.ok, okCall:null};
		$.extend(op, options);
		var buttons = [
			{name:op.okName, call: op.okCall, keyCode:DWZ.keyCode.ENTER}
		];
		this._open(type, msg, buttons);
	},
	/**
	 * 
	 * @param {Object} msg
	 * @param {Object} options {okName, okCal, cancelName, cancelCall}
	 */
	confirm: function(msg, options) {
	
		var op = {okName:$.regional.alertMsg.butMsg.ok, okCall:null, cancelName:$.regional.alertMsg.butMsg.cancel, cancelCall:null};
		$.extend(op, options);
		var buttons = [
			{name:op.okName, call: op.okCall, keyCode:DWZ.keyCode.ENTER ,classM:"sure"},
			{name:op.cancelName, call: op.cancelCall, keyCode:DWZ.keyCode.ESC ,classM:"cancel"}
		];
		//this._open(this._types.confirm, msg, buttons);

    	var curWwwPath=window.document.location.href;
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    var localhostPaht=curWwwPath.substring(0,pos);
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    var uuurl = (localhostPaht+projectName);
		var type = this._types.confirm;
		
		$(this._boxId).remove();
		
		var butsHtml = "";
		if (buttons) {
			for (var i = 0; i < buttons.length; i++) {
				var sRel = buttons[i].call ? "callback" : "";
				butsHtml += DWZ.frag["alertButConfirmFrag"].replace("#butMsg#", buttons[i].name).replace("#callback#", sRel).replace("#class#",buttons[i].classM).replace("#class#",buttons[i].classM).replace("#class#",buttons[i].classM).replace("#class#",buttons[i].classM).replace("#class#",buttons[i].classM);
			}
		}
		
		var boxHtml = DWZ.frag["alertConfirmFrag"].replace("#message#", msg).replace("#butFragment#", butsHtml).replace("#url#", uuurl);
		
		
		
		$(boxHtml).appendTo("body").css({top:-$(this._boxId).height()+"px"}).animate({top:"192px"}, 0);
		
		if (this._closeTimer) {
			clearTimeout(this._closeTimer);
			this._closeTimer = null;
		}

		$(this._bgId).show();
		
		
		//用于屏蔽点击回车，触发click事件，再次打开alert
		$('<input type="text" style="width:0;height:0;" name="_alertFocusCtr"/>').appendTo(this._boxId).focus().hide();
		
		var jButs = $(this._boxId).find("a.button");
		var jCallButs = jButs.filter("[rel=callback]");
		var jDoc = $(document);
		
		for (var i = 0; i < buttons.length; i++) {
			if (buttons[i].call) 
			{
			  jCallButs.eq(i).click(buttons[i].call);
			}
			if (buttons[i].keyCode == DWZ.keyCode.ENTER) {
				jDoc.bind("keydown",{target:jButs.eq(i)}, this._keydownOk);
			}
			if (buttons[i].keyCode == DWZ.keyCode.ESC) {
				jDoc.bind("keydown",{target:jButs.eq(i)}, this._keydownEsc);
			}
		}
		for(var j =0;j<jButs.length;j++)
		{
		  jButs.eq(j).click(function(){alertMsg.close();});
		}

		
	}
};

