/**
 * @author Gaozhixiang
 * 
 */
$(function(){
	$(".selectpicker",document).selectpicker({'width': '150'});
	$(".form_datetime",document).datetimepicker({language: 'zh-CN'});
	$(".filechange",document).fileChange();
	//$("input[type=checkbox]",document).checkboxChange();
	$(".relevance",document).relevance();
	$("body").append('<DIV id=alertBackground class=alertBackground><div class="zeng_msgbox_layer_wrap" id="progressBar" style="top: 40%;"><span class="zeng_msgbox_layer" style="z-index: 10000;" id="mode_tips_v2"><span class="gtl_ico_clear"></span><span class="gtl_ico_loading"></span>疯狂加载中，请稍后...<span class="gtl_end"></span></span></div></DIV>');
   	$("#alertBackground").hide();
}); 

function divSearch(form, rel){
	var $form = $(form);
	if(!validation(form)) {
		return false;
	}
//	if (form[DWZ.pageInfo.pageNum]) form[DWZ.pageInfo.pageNum].value = 1;
	if (rel) {
		$("#alertBackground").show();
		var $box = $("#" + rel);
		if($box.length<=0)
			$box = $("#" + rel);
		$box.ajaxUrl({
			type:"POST", url:$form.attr("action"), data: $form.serializeArray(), callback:function(){
				$box.find("[layoutH]").layoutH();
			}
		});
	}
	
	return false;
}


function divSearch2(form, rel,type){
	var $form = $(form);
	if(!validation(form)) {
		return false;
	}
//	if (form[DWZ.pageInfo.pageNum]) form[DWZ.pageInfo.pageNum].value = 1;
	if(type)
	{
		if (rel) {
			$("#"+type).show();
			var $box = $("#" + rel);
			if($box.length<=0)
				$box = $("#" + rel);
			$box.ajaxUrl({
				type:"POST", url:$form.attr("action"), data: $form.serializeArray(), callback:function(){
					$box.find("[layoutH]").layoutH();
					$("#"+type).hide();
				}
			});
		}
	}
	return false;
}



function validateCallback(form, callback, confirmMsg) {
	var $form = $(form);
	if (!validation(form)) {
		return false;
	}
	
	var _submitFn = function(){
		$("#alertBackground").show();
		$.ajax({
			type: form.method || 'POST',
			url:$form.attr("action"),
			data:$form.serializeArray(),
			dataType:"json",
			cache: false,
			success: callback || DWZ.ajaxDone,
			error: DWZ.ajaxError
		});
	}
	
	if (confirmMsg) {
		alertMsg.confirm(confirmMsg, {okCall: _submitFn});
	} else {
		_submitFn();
	}
	
	return false;
}

function ajaxTodo(url, callback, title){
	var $callback = callback;
	if(confirm(title)) { 
		$("#alertBackground").show();
		$.ajax({
			type:'POST',
			url:url,
			dataType:"json",
			cache: false,
			success: callback,
			error: DWZ.ajaxError
		});
	}
	
}

/**
 * 带文件上传的ajax表单提交
 * @param {Object} form
 * @param {Object} callback
 */
function iframeCallback(form, callback){
	var $form = $(form), $iframe = $("#callbackframe");
	if(!validation(form)) {return false;}
	$("#alertBackground").show();
	if ($iframe.size() == 0) {
		$iframe = $("<iframe id='callbackframe' name='callbackframe' src='about:blank' style='display:none'></iframe>").appendTo("body");
	}
	if(!form.ajax) {
		$form.append('<input type="hidden" name="ajax" value="1" />');
	}
	form.target = "callbackframe";
	
	_iframeResponse($iframe[0], callback || DWZ.ajaxDone);
//	$("#alertBackground").hide();
}
function _iframeResponse(iframe, callback){
	var $iframe = $(iframe), $document = $(document);
	
	$document.trigger("ajaxStart");
	
	$iframe.bind("load", function(event){
		$iframe.unbind("load");
		$document.trigger("ajaxStop");
		
		if (iframe.src == "javascript:'%3Chtml%3E%3C/html%3E';" || // For Safari
			iframe.src == "javascript:'<html></html>';") { // For FF, IE
			return;
		}

		var doc = iframe.contentDocument || iframe.document;

		// fixing Opera 9.26,10.00
		if (doc.readyState && doc.readyState != 'complete') return; 
		// fixing Opera 9.64
		if (doc.body && doc.body.innerHTML == "false") return;
	   
		var response;
		
		if (doc.XMLDocument) {
			// response is a xml document Internet Explorer property
			response = doc.XMLDocument;
		} else if (doc.body){
			try{
				response = $iframe.contents().find("body").text();
				response = jQuery.parseJSON(response);
			} catch (e){ // response is html document or plain text
				response = doc.body.innerHTML;
			}
		} else {
			// response is a xml document
			response = doc;
		}
		
		callback(response);
	});
}

function validation(form)
{
	var $form = $(form);
  	var formState = true;

  	var validateField = function(field, valid) { 
  		var el = $(field), error = false, errorMsg = '';
    	for (i = 0; i < valid.length; i++) 
    	{
	            var x = true, flag = valid[i];//, msg = (el.attr(flag + '-message')==undefined)?null:el.attr(flag + '-message');
	            if (flag.substr(0, 1) == '!') {
	                x = false;
	                flag = flag.substr(1, flag.length - 1);
            }
            var rules = DWZ.validRules;
            for (j = 0; j < rules.length; j++) {
                var rule = rules[j];
                if (flag == rule.name) {
                    if (rule.validate.call(field, el.val()) == x) {
                        error = true;
                        errorMsg = rule.defaultMsg;//(msg == null)?rule.defaultMsg:msg;
                        break;
                    }
                }
            }
            if (error) 
            {
            	break;
            }
        }
        if (error) {
        	el.addClass('bk-error'); 
        	if(errorMsg!='')
        	{
	        	el.bind('mouseover', function() {
						tooltip	= $(this);
						if(tooltip.hasClass('showed-tooltip')) 
								return false;
						tooltip.addClass('showed-tooltip').after('<div class="tooltip-shiny-red" style="z-index:999999;">'+errorMsg+'</div>');
						$class = tooltip.next('.tooltip-shiny-red:first');
						tooltipPosTop 	= tooltip.position().top - $class.outerHeight();//-10
						tooltipPosLeft = tooltip.position().left;
						tooltipPosLeft = tooltipPosLeft - (($class.outerWidth()/2) - tooltip.outerWidth()/2);
						$class.css({ 'left': tooltipPosLeft, 'top': tooltipPosTop }).animate({'opacity':'1', 'marginTop':'0'}, 500);		
					}).bind('mouseout', function() 
					{
						$(this).next('.tooltip-shiny-red:first').animate({'opacity':'0', 'marginTop':'-10px'}, 500, function() 
						{
							$(this).remove();
							tooltip.removeClass('showed-tooltip');
						});
					});
			}
        }
        return !error;
     };
        
        
       	$('.bk-error', $form).removeClass('bk-error');
		$('input, textarea', $form).each(function () 
		{
                var el = $(this), valid = (el.attr('check-type')==undefined)?null:el.attr('check-type').split(' ');
                el.unbind('mouseout').unbind('mouseover');
                if (valid != null && valid.length > 0) {
                    if (!validateField(this, valid)) {
                        formState = false;
                    }
                }
          });
         $('select', $form).each(function () 
		 {
                var el = $(this), valid = (el.attr('check-type')==undefined)?null:el.attr('check-type').split(' ');
                if (valid != null && valid.length > 0) {
                    if (!validateField(this, valid)) {
                    	el.next("div.bootstrap-select:first").children('button').addClass('bk-error');
                        formState = false;
                    }
                }
          });
          return formState;
} 

var DWZ = {
	// sbar: show sidebar
	keyCode: {
		ENTER: 13, ESC: 27, END: 35, HOME: 36,
		SHIFT: 16, TAB: 9,
		LEFT: 37, RIGHT: 39, UP: 38, DOWN: 40,
		DELETE: 46, BACKSPACE:8
	},
	eventType: {
		pageClear:"pageClear",	// 用于重新ajaxLoad、关闭nabTab, 关闭dialog时，去除xheditor等需要特殊处理的资源
		resizeGrid:"resizeGrid"	// 用于窗口或dialog大小调整
	},
	isOverAxis: function(x, reference, size) {
		//Determines when x coordinate is over "b" element axis
		return (x > reference) && (x < (reference + size));
	},
	isOver: function(y, x, top, left, height, width) {
		//Determines when x, y coordinates is over "b" element
		return this.isOverAxis(y, top, height) && this.isOverAxis(x, left, width);
	},
	
	pageInfo: {pageNum:"page.pageNum", numPerPage:"page.numPerPage", orderField:"page.orderField", orderDirection:"page.orderDirection"},
	statusCode: {ok:200, error:300, timeout:301},
	ui:{sbar:true},
	frag:{}, //page fragment
	_msg:{}, //alert message
	_set:{
		loginUrl:"", //session timeout
		loginTitle:"", //if loginTitle open a login dialog
		debug:false
	},
	msg:function(key, args){
		var _format = function(str,args) {
			args = args || [];
			var result = str || "";
			for (var i = 0; i < args.length; i++){
				result = result.replace(new RegExp("\\{" + i + "\\}", "g"), args[i]);
			}
			return result;
		}
		return _format(this._msg[key], args);
	},
	debug:function(msg){
		if (this._set.debug) {
			if (typeof(console) != "undefined") console.log(msg);
			else alert(msg);
		}
	},
	loadLogin:function(){
		if ($.pdialog && DWZ._set.loginTitle) {
			$.pdialog.open(DWZ._set.loginUrl, "login", DWZ._set.loginTitle, {mask:true,width:520,height:260});
		} else {
			window.location = DWZ._set.loginUrl;
		}
	},
	
	/*
	 * json to string
	 */
	obj2str:function(o) {
		var r = [];
		if(typeof o =="string") return "\""+o.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+"\"";
		if(typeof o == "object"){
			if(!o.sort){
				for(var i in o)
					r.push(i+":"+DWZ.obj2str(o[i]));
				if(!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)){
					r.push("toString:"+o.toString.toString());
				}
				r="{"+r.join()+"}"
			}else{
				for(var i =0;i<o.length;i++) {
					r.push(DWZ.obj2str(o[i]));
				}
				r="["+r.join()+"]"
			}
			return r;
		}
		return o.toString();
	},
	jsonEval:function(data) {
		try{
			if ($.type(data) == 'string')
				return eval('(' + data + ')');
			else return data;
		} catch (e){
			return {};
		}
	},
	ajaxError:function(xhr, ajaxOptions, thrownError){
		if (alertMsg) {
			alertMsg.error("<div>Http status: " + xhr.status + " " + xhr.statusText + "</div>" 
				+ "<div>ajaxOptions: "+ajaxOptions + "</div>"
				+ "<div>thrownError: "+thrownError + "</div>"
				+ "<div>"+xhr.responseText+"</div>");
		} else {
			alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
		}
	},
	ajaxDone:function(json){
		if(json.statusCode == DWZ.statusCode.error) {
			if(json.message && alertMsg) alertMsg.error(json.message);
		} else if (json.statusCode == DWZ.statusCode.timeout) {
			if(alertMsg) alertMsg.error(json.message || DWZ.msg("sessionTimout"), {okCall:DWZ.loadLogin});
			else DWZ.loadLogin();
		} else {
			if(json.message && alertMsg) alertMsg.correct(json.message);
		};
	},

	init:function(pageFrag, options){
		var op = $.extend({
				loginUrl:"login.html", loginTitle:null, callback:null, debug:false, 
				statusCode:{}
			}, options);
		this._set.loginUrl = op.loginUrl;
		this._set.loginTitle = op.loginTitle;
		this._set.debug = op.debug;
		$.extend(DWZ.statusCode, op.statusCode);
		$.extend(DWZ.pageInfo, op.pageInfo);
		
		jQuery.ajax({
			type:'GET',
			url:pageFrag,
			dataType:'xml',
			timeout: 50000,
			cache: false,
			error: function(xhr){
				alert('Error loading XML document: ' + pageFrag + "\nHttp status: " + xhr.status + " " + xhr.statusText);
			}, 
			success: function(xml){
				$(xml).find("_PAGE_").each(function(){
					var pageId = $(this).attr("id");
					if (pageId) DWZ.frag[pageId] = $(this).text();
				});
				
				$(xml).find("_MSG_").each(function(){
					var id = $(this).attr("id");
					if (id) DWZ._msg[id] = $(this).text();
				});
				
				if (jQuery.isFunction(op.callback)) op.callback();
			}
		});
		
		var _doc = $(document);
		if (!_doc.isBind(DWZ.eventType.pageClear)) {
			_doc.bind(DWZ.eventType.pageClear, function(event){
				var box = event.target;
				if ($.fn.xheditor) {
					$("textarea.editor", box).xheditor(false);
				}
			});
		}
	},
	validRules : [
            {name: 'required', validate: function(value) {return ($.trim(value) == '');}, defaultMsg:''},
            {name: 'number', validate: function(value) {if(value!=null&&value!=''){return (!/^[0-9]+.?[0-9]*$/.test(value)); }else {return false;}}, defaultMsg: ''},
            {name: 'money', validate: function(value) {if(value!=null&&value!=''){return (!/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test(value)); }else {return false;}}, defaultMsg: ''},
            {name: 'percent', validate: function(value) {if(value!=null&&value!=''){return (!/^(\d{1,2}(\.\d{1,2})?|100)$/.test(value)); }else {return false;}}, defaultMsg: ''},
            {name: 'mail', validate: function(value) {if(value!=null&&value!='') return (!/^[a-zA-Z0-9]{1}([\._a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+){1,3}$/.test(value)); else {return false;}}, defaultMsg: ''},
            {name: 'char', validate: function(value) {if(value!=null&&value!='') return (!/^[a-z\_\-A-Z]*$/.test(value)); else {return false;}}, defaultMsg: ''},
            {name: 'chinese', validate: function(value) {if(value!=null&&value!='') return (!/^[\u4e00-\u9fff]$/.test(value)); else {return false;}}, defaultMsg: ''}
        ]
};
