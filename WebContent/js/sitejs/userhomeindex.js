/**
 * 打开页面
 * 
 * @param {}
 *            pageurl
 */
var openpage = function(index, currentuserid, type, neebarlocation) {
	var querurl = 'pagingsharedoc.do';
	if (type == 1) {
		querurl = 'pagingdoc.do';
	} else if (type == 2) {
		querurl = 'pagingsharedoc.do';
	} else {

	}
	$
			.ajax({
				async : true,
				cache : false,
				type : 'POST',
				dataType : "json",
				url : querurl,// 请求的action路径
				beforeSend : function() {
					// 启动进度条
					if (neebarlocation) {
						var sheetheight = $(".mVsheet").css("height");
						var pxindex = sheetheight.indexOf('px');
						sheetheight = sheetheight.substring(0, pxindex);
						sheetheight = sheetheight - 400 + 900;
						$(".loadingbox").css("top", "" + sheetheight + "px");
					}

					$(".loadingbox").show();
				},
				error : function() {// 请求失败处理函数
					alert('请求失败');
				},
				data : {
					userid : currentuserid,
					pageindex : index
				},
				complete : function() {
					$(".loadingbox").hide();
				},
				success : function(data) { // 请求成功后处理函数。
					var htmlstrr = "";
					for (i in data.doclist) {
						if (type == 1) {
							htmlstrr = htmlstrr
									+ '<div class=\"m1ln\"><a><img src="img/dot.gif"></a>'
									+ '<a '
									+ 'href=\"getuserdocdetail.do?docid='
									+ data.doclist[i].docid + '\">'
									+ data.doclist[i].doctitle + '</a>&nbsp;'
									+ '</div>';
						} else if (type == 2) {
							htmlstrr = htmlstrr
									+ '<div class=\"sharenwsl1\"><div class="title" style="height:230px;">'
									+ '<a '
									+ 'href=\"getuserdocdetail.do?docid='
									+ data.doclist[i].docid
									+ '\">'
									+ data.doclist[i].doctitle
									+ '</a>'
									+ '</div><div class=\"author\"><a href=\"gouserindex.do?userid='
									+ data.doclist[i].userid + '\">'
									+ data.doclist[i].docauthor
									+ '</a></div></div>';

						}

					}
					if (type == 1) {
						$(".artclList:eq(0)").html(htmlstrr);
					} else if (type == 2) {
						$(".artclList:eq(1)").html(htmlstrr);
					} else {

					}
					if (type == 1) {
						// 设置当前 连接的
						$(".spanstyle").each(function(i, o) {
							$(o).removeClass("curspanstyle");
							$(o).addClass("spanstyle");

						});
						$(".curspanstyle").each(function(i, o) {
							$(o).removeClass("curspanstyle");
							$(o).addClass("spanstyle");

						});
						$(".spanstyle#page" + index).addClass("curspanstyle")
								.removeClass("spanstyle");
					} else if (type == 2) {
						// 设置当前 连接的
						$(".sharespanstyle").each(function(i, o) {
							$(o).removeClass("cursharespanstyle");
							$(o).addClass("sharespanstyle");

						});
						$(".cursharespanstyle").each(function(i, o) {
							$(o).removeClass("cursharespanstyle");
							$(o).addClass("sharespanstyle");

						});
						$(".sharespanstyle#page" + index).addClass(
								"cursharespanstyle").removeClass(
								"sharespanstyle");
					}

				}
			});

}
var openPhotoList = function(albumid) {
	if (albumid == null || albumid == '') {
		return;
	}
	var userid = $("#userid").val();
	if (userid == null || userid == '') {
		return;
	}
	$("#imggroupid").val(albumid);
	$("#alinkform").attr('action', 'getimglist.do');
	$("#alinkform").submit();
};
/**
 * 添加朋友
 */
var addfriends = function(visiteduserid, isagree, messid) {
	// 少一个弹出对话框，等ui做好以后进行补充
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : "json",
		url : "addfriend.do",// 请求的action路径
		error : function() {// 请求失败处理函数
			alert('请求失败');
		},
		data : {
			userid : visiteduserid,
			agree : isagree,
			messageid : messid
		},
		success : function(data) { // 请求成功后处理函数。
			if (data.mess == '01') {
				// alert('  ');
				MessageWindow.showMess("   ");
			} else {
				// alert('    ');
				MessageWindow.showMess("    ");
			}

			$("#accordion").dialog("close");
		}
	});
};
/**
 * 给博主写信
 * 
 * @param {}
 *            visiteduserid
 */
var sendmessage = function(visiteduserid) {
	// 
	var message = $("#messagediv").text();
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : "json",
		url : "sendMessage.do",// 请求的action路径
		error : function() {// 请求失败处理函数
			alert('请求失败');
		},
		data : {
			userid : visiteduserid,
			mess : message,
			messtype : 2
		},
		success : function(data) { // 请求成功后处理函数。
			// alert(data.mess);
			if (data.mess == 'success') {
				MessageWindow.showMess('      ');
			} else {
				MessageWindow.showMess(data.mess);
			}

			$("#messdiv").dialog("close");
		}
	});

};

var writemessage = function() {
	var islogin = false;
	islogin = checklogin();
	if (islogin == false) {
		MessageWindow
				.showMess('         ');
		return;
	}
	$("#messdiv").dialog({
		height : 480,
		width : 420,
		resizable : false,
		modal : true

	});
};
/**
 * 
 * @param {}
 *            emotionname
 */
var addmessface = function(emotionname) {
	$("#messagediv").html(
			$("#messagediv").html() + $('<p>[' + emotionname + ']</p>').html());
};
/**
 * 列出全部别人写给自己的和自己发给别人的信
 */
var receivemessage = function() {

	/*$
			.ajax({
				async : true,
				cache : false,
				type : 'POST',
				dataType : "json",
				url : "getmessages.do",// 请求的action路径
				error : function() {// 请求失败处理函数
					alert('请求失败');
				},
				success : function(data) { // 请求成功后处理函数。
					var innerHTML = '';
					for (i in data.receiveMess) {
						innerHTML = innerHTML
								+ ' <div class=\"xldgurg\" style=\"width: 124px; height: 470px;\"> '
								+ ' <div class=\"avtr\"><a '
								+ ' href=\"gouserindex.do?userid= '
								+ data.receiveMess[i].messagesenderid
								+ ' \"> '
								+ ' <img '
								+ ' src=\"getsmheadimge.do?userid='
								+ data.receiveMess[i].messagesenderid
								+ '\"'
								+ ' width=\"570\" height=\"447\" />'
								+ ' </a> <input type=\"checkbox\" name=\"selectbox\"'
								+ ' id=\"'
								+ data.receiveMess[i].messagesenderid
								+ ' \"/>'
								+ ' </div>'
								+ ' <div class=\"desc  \" style=\"color: #000; height: 370px;widht:120px;\">'
								+ ' <div class=\"m1ln\" style=\"height: 350px;\">'
								+ ' <a' + ' href=\"gouserindex.do?userid='
								+ data.receiveMess[i].messagesenderid + ' \">'
								+ data.receiveMess[i].artname + ' </a> ';
						var kindstr = "";
						var messstr = "";
						if (data.receiveMess[i].messtype == 2) {
							kindstr = "    ";
							messstr = "    "
									+ data.receiveMess[i].sendtime
									+ "<br><a href=\"javascript:readmessage('"
									+ data.receiveMess[i].messageid
									+ "',1);\" style=\"color:#f00\"> </a>";
						} else if (data.receiveMess[i].messtype == 4) {
							kindstr = "   ";
							messstr = "   "
									+ data.receiveMess[i].sendtime
									+ '<br><a href=\"javascript:addfriends(\''
									+ data.receiveMess[i].messagesenderid
									+ '\',1,\''
									+ data.receiveMess[i].messageid
									+ '\')\" style=\"color:#f00;\"></a>  <a href=\"\" style=\"color:#f00;\"> </a>';
						} else {

						}

						innerHTML = innerHTML
								+ kindstr
								+ ' </div>'
								+ ' <div class=\"m1ln\" style=\"height: 350px;width:100px;\" >'
								+ messstr + '</div>' + '</div>' + '</div>';
					}
					$("#receivediv").html(innerHTML);*/
	//
	/*innerHTML = "";
	for (i in data.sendMess) {
		innerHTML = innerHTML
				+ ' <div class=\"xldgurg\" style=\"width: 124px; height: 470px; !important;\"> '
				+ ' <div class=\"avtr\"><a '
				+ ' href=\"gouserindex.do?userid= '
				+ data.sendMess[i].userid
				+ ' \"> '
				+ ' <img '
				+ ' src=\"getsmheadimge.do?userid='
				+ data.sendMess[i].userid
				+ '\"'
				+ ' width=\"570\" height=\"447\" />'
				+ ' </a> <input type=\"checkbox\" name=\"selectbox\"'
				+ ' id=\"'
				+ data.sendMess[i].userid
				+ ' \"/>'
				+ ' </div>'
				+ ' <div class=\"desc  \" style=\"color: #000; height: 370px;widht:120px;!important;\">'
				+ ' <div class=\"m1ln\" style=\"height: 350px;\">'
				+ ' <a'
				+ ' href=\"gouserindex.do?userid='
				+ data.sendMess[i].userid
				+ ' \">'
				+ data.sendMess[i].artname
				+ '    </a>'
				+ ' </div>'
				+ ' <div class=\"m1ln\" style=\"height: 350px;width:100px; !important;\" >'
				+ '   '
				+ data.sendMess[i].sendtime
				+ '<br> <a href=\"\" style=\"color:#f00\">  </a></div></div></div>';
	}
	
	$("#senddiv").html(innerHTML);
	
	$("#accordion").dialog({
		height : 510,
		width : 1000,
		resizable : false,
		modal : true

	});
	}
	});*/

	$("#accordion").dialog({
		height : 510,
		width : 900,
		resizable : false,
		modal : true

	});

};
/**
 * 切换div
 * 
 * @param {}
 *            currentdivid
 * @param {}
 *            nextdivid
 */
var switchdiv = function(currentdivid, nextdivid) {
	var display = $("#" + currentdivid).css("display");
	if (display != 'none') {
		$("#" + currentdivid).css("display", "none");
		$("#" + nextdivid).css("display", "block");
	} else {
		$("#" + currentdivid).css("display", "block");
		$("#" + nextdivid).css("display", "none");
	}
};
/**
 * 显示用户信息
 */
var showuserinfo = function(userid) {
	$("#userinfo").dialog({
		height : 480,
		width : 900,
		resizable : true,
		modal : true

	});

};
/**
 * 
 */
var openaddfrienddl = function() {
	var islogin = false;
	islogin = checklogin();
	if (!islogin) {
		MessageWindow
				.showMess('          ');
		return;
	}
	$("#addfriendmess").text('         ');
	$("#addfrienddiv").dialog({// addfriendmess 13347126631
		height : 470,
		width : 270,
		resizable : true,
		modal : true

	});

};
/**
 * 
 * @param {}
 *            visiteduserid
 */
var sendaddfriendmess = function(visiteduserid) {
	// addfrienddiv
	var mess = $("#addfriendmess").text();
	alert(mess);
	$
			.ajax({
				async : false,
				cache : false,
				type : 'POST',
				dataType : "json",
				url : "sendMessage.do",// 请求的action路径
				error : function() {// 请求失败处理函数
					alert('请求失败');
				},
				data : {
					userid : visiteduserid,
					mess : mess,
					messtype : 4
				},
				success : function(data) { // 请求成功后处理函数。
					if (data.mess == '01') {
						// alert('   ');
						MessageWindow.showMess('    ');
					} else if (data.mess == '02') {
						// alert('        
						//   ');
						MessageWindow
								.showMess('                 ');
					}
					$("#addfrienddiv").dialog("close");
				}
			});

};
var delfriend = function() {
	showConfirmMess("      ", function() {
		if (this.getValue() == true) {
			delfriend();
		}
	});

}
var deletefriend = function() {
	var id = $("[name=selectedradio]").filter(':checked').attr("id");
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : "json",
		url : "delfriend.do",// 请求的action路径
		error : function() {// 请求失败处理函数
			alert('请求失败');
		},
		data : {
			friendid : id
		},
		success : function(data) { // 请求成功后处理函数。
			if (data.mess == '01') {
				// alert('  ');
				MessageWindow.showMess('   ');
			} else if (data.mess == '02') {
				// alert(' ');
				MessageWindow.showMess('        ');
			}
		}
	});
}

var readmessage = function(messid, type) {
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : "json",
		url : "readmessage.do",// 请求的action路径
		error : function() {// 请求失败处理函数
			alert('请求失败');
		},
		data : {
			messageid : messid
		},
		success : function(data) { // 请求成功后处理函数。
			if (data.success == '1') {
				// alert(data.messvalue.contenthtml);
				var content = "<div class=\"mVsheet\">"
						+ data.messvalue.contenthtml + "</div>";
				if (type == 1) {
					$("#receivediv").html(content);
				} else {
					$("#senddiv").html(content);
				}
			} else if (data.success == '0') {
				// alert('     ');
				MessageWindow.showMess('        ');
			}
		}
	});

};
var switchclass = function(a) {
	$("#" + a).addClass("curspanstyle");
	$("#" + a).removeClass("spanstyle");
};
var checklogin = function() {
	var islogin = false;
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : "json",
		url : 'checklogin.do',// 请求的action路径
		error : function() {// 请求失败处理函数
			MessageWindow.showMess('         ');
		},
		success : function(data) {
			if (data.login == 'true') {
				islogin = true;
			} else {
				islogin = false;
			}
		}
	});
	return islogin;
};
/**
 * 
 */
var showdiv = function(id1, id2, id3) {
	$("#" + id1).css("display", "block");
	$("#" + id2).css("display", "none");
	$("#" + id3).css("display", "none");
};