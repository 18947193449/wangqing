<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> </title>
<link href="img/css/main.css" type="text/css" rel="stylesheet" />
<link href="img/css/doccheck.css" type="text/css" rel="stylesheet" />
<link href="img/css/listpages.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jqGrid/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/util/js/messageWindow.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/sitejs/userlist.js"></script>
<link rel="stylesheet"
	href="js/jqui/css/ui-lightness/jquery-ui-1.10.3.custom.min.css" />
<script src="js/jqui/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="js/messagebox/jquery.msgbox.js"></script>
<script src="js/messagebox/jquery.dragndrop.min.js"></script>
<link rel="stylesheet" href="js\messagebox\jquery.msgbox.css" />
</head>
<body>
	<div class="lmainR ofh" style="text-align: center; height: 70px;">
		<img src="img/logo.png" width="982" />
	</div>
	<div class="lmainR ofh">
		<form action="userlist.do" method="post" id="queryForm">
			<div class="lmainR"
				style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr; height: 600px">
				<table style="border: solid 1px #eee; height: 598px;" valign="top">
					<tr>
						<td>
							<div class="m1ln h100">  </div>
						</td>
						<td>
							<div class="inputHolder" style="height: 160px">
								<select id="district" name="district"
									style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr; height: 70px">
									<option value="#"></option>
								</select> <select id="qx" name="qx"
									style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr; height: 70px">
									<option value="#"></option>
								</select>
							</div>
						</td>
						<td>
							<div class="m1ln h100"> </div>
						</td>
						<td>
							<div class="inputHolder">
								<input type="text" name="username" id="username" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="m1ln h100">  </div>
						</td>
						<td>
							<div class="inputHolder">
								<input type="text" name="strregtime" id="strregtime"
									style="height: 40px;" class="modTxtTime" readonly="readonly"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /> - <input
									type="text" name="endregtime" id="endregtime"
									style="height: 40px;" class="modTxtTime" readonly="readonly"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<div class="m1ln h100">
								&nbsp;&nbsp;<a href="javascript:searchusers();"></a>
							</div>
						</td>
						<td>
							<div class="m1ln h100">
								&nbsp;&nbsp;<a href="javascript:clearQueryForm();"></a>
							</div>
						</td>

					</tr>
				</table>
				<div class="  lcell" style="width: 870px;">
					<div class="lcell " style="width: 870px; height: 600px;">
						<div class=" " style="height: 600px;">
							<div class="ttl1 m1ln">
								<a href="#"> </a>
							</div>
							<div style="width: 820px; margin: 0px; height: 500px" class="ofh">
								<c:forEach items="${users}" var="userValue" varStatus="status">
									<div class="xldgurg" style="width: 124px; height: 470px;">
										<div class="avtr">
											<a
												href="gouserindex.do?userid=<c:out value="${userValue.userid}" />">
												<img
												src="getsmheadimge.do?userid=<c:out value="${userValue.userid}"/>"
												width="570" height="447" />
											</a> <input type="checkbox" name="selectbox"
												id="<c:out value="${userValue.userid}" />" />
										</div>
										<div class="desc  " style="color: #000; height: 390px;">
											<div class="m1ln" style="height: 390px;">
												<a
													href="gouserindex.do?userid=<c:out value="${userValue.userid}" />">
													<span class="label1"><c:out
															value="${userValue.artname}" /> </span> : <c:out
														value="${userValue.regdateStr}" />
												</a>
											</div>
											<div class="m1ln" style="height: 390px;">
												<span class="label1">  : </span>
												<c:out value="${userValue.nowprovince}"
													default="  " />
											</div>
											<div class="m1ln" style="height: 390px;">
												<span class="label1">  :</span>
												<c:choose>
													<c:when test="${userValue.sex==1}">
							         
							       </c:when>
													<c:when test="${userValue.sex==0}">
							          
							       </c:when>
													<c:otherwise>
							          
							       </c:otherwise>
												</c:choose>
												<span class="label1">    :</span>
												<c:out value="${userValue.age}" default="  " />
												<span class="label1">   :</span>
												<c:out value="${userValue.regdatestr}" default="  " />
											</div>
											<div class="m1ln" style="height: 390px;">
												<span class="label1">   : </span>
												<c:out value="${totalVisitCount}" />
												<span class="label1">   :</span> <span
													class="label1">   :<span>
											</div>
											<div class="m1ln" style="height: 390px;">
												<span class="label1">    :</span>
												<c:out value="${userValue.logindatestr}" default="" />
												<span class="label1">    : </span>
												<c:choose>
													<c:when test="${userValue.stoped==1}">
							          
							       </c:when>
													<c:otherwise>
							           							      
							       </c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<input type="hidden" name="pageindex" id="pageindex">
							<!-- 分页控件的位置 -->
							<div class="vpagenav">
								<span id="picbtn1"
									style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<a>&lt;</a>&nbsp;
								</span>
								<c:forEach items="${pagingindexs}" var="pagingindex"
									varStatus="status">
									<a
										href="javascript:paginguser(<c:out value="${pagingindex.pageindex}"
										default="" />)"><c:if
											test="${pagingindex.doc==1}">
											<c:if test="${pagingindex.front==1}">									 
									 ..									 
									</c:if>
										</c:if> <c:if test="${pagingindex.current==1}">
											<span id="picbtn1"
												style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(f, f, f); line-height: 20px; width: 20px;">&nbsp;<c:out
													value="${pagingindex.pageindex}" default="" />&nbsp;
											</span>
										</c:if> <c:if test="${pagingindex.current==0}">
											<span id="picbtn1"
												style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 20px; width: 20px;">&nbsp;<c:out
													value="${pagingindex.pageindex}" default="" />&nbsp;
											</span>
										</c:if> <!-- 									 <span id="picbtn1" --> <%-- 									style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<c:out --%>
										<%-- 											value="${pagingindex.pageindex}" default="" />&nbsp; --%>
										<!-- 								</span>  --> <c:if test="${pagingindex.doc==1}">
											<c:if test="${pagingindex.front==0}">									 
									 ..									 
									</c:if>

										</c:if> </a>
								</c:forEach>
								<span id="picbtn1"
									style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<a>&lt;</a>&nbsp;
								</span> (
								<c:out value="${usercount}" default="0" />
								)
							</div>
							<!-- 分页控件的位置 -->
						</div>
					</div>
				</div>
				<br>

				<div class="mnlist" style="text-align: center;">
					<a href="javascript:stopuser()">  &nbsp;&nbsp;</a><a
						href="javascript:reuseuser()">&nbsp;
						&nbsp;&nbsp;&nbsp;</a><a href="javascript:deleteuser()">&nbsp;&nbsp;&nbsp;</a>
					<a href="sitemanagerindex.do">  </a>
				</div>
			</div>
		</form>
	</div>
	<div class="lmainR ofh" style="text-align: center;">
		<div class="tailCard">
			<%@ include file="../website/tail.jsp"%>
		</div>
		<div class="cbt"></div>
	</div>
</body>
</html>