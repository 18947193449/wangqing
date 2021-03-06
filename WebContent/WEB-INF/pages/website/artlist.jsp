<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="site/css/main.css" rel="stylesheet" type="text/css" />
<link href="site/css/index.css" rel="stylesheet" type="text/css" />
<!-- <link href="img/css/main.css" type="text/css" rel="stylesheet" /> -->
<!-- <link href="img/css/huh.css" type="text/css" rel="stylesheet" /> -->
<link href="img/css/doccheck.css" type="text/css" rel="stylesheet" />
<link href="img/css/listpages.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jqGrid/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/sitejs/searchdoc.js"></script>
<script type="text/javascript" src="js/util/js/messageWindow.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet"
	href="js/jqui/css/ui-lightness/jquery-ui-1.10.3.custom.min.css" />
<script src="js/jqui/js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<body>
	<div class="wrp m0a logo">
		<div class="naveFrame">
			<%@ include file="head.jsp"%>
		</div>
		<div class="cbt"></div>
	</div>
	<div class="wrp m0a ribbon"></div>
	<div class="lmainR ofh">
		<form action="searchdoc.do" id="Form" method="post">
			<div class="lmainR"
				style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr;">
				<div style="height: 598px; border: solid 1px #eee;">
					<table style="padding-top: 2em;" valign="top">
						<tr>
							<td>
								<div class="m1ln h100">  </div>
							</td>
							<td>
								<div class="inputHolder">
									<select id="channel" name="channel"
										style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr;">
										<option value="#"> </option>
									</select>
								</div>
							</td>
							<td>
								<div class="m1ln h100">  </div>
							</td>
							<td>
								<div class="inputHolder" style="background: #eee;">
									<input type="text" name="strcrtime" id="strcrtime"
										value="<c:out value="${queryDocForm.strcrtime}"/>"
										style="height: 40px;" class="modTxtTime" readonly="readonly"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /> - <input
										type="text" name="endcrtime" id="endcrtime"
										value="<c:out value="${queryDocForm.endcrtime}"/>"
										style="height: 40px;" class="modTxtTime" readonly="readonly"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="m1ln h100"> </div>
							</td>
							<td style="background: #eee;">
								<div class="inputHolder">
									<input type="text" name="authorname" id="authorname"
										value="<c:out value="${queryDocForm.authorname}"/>" />
								</div>
							</td>
							<td>
								<div class="m1ln h100">  </div>
							</td>
							<td>
								<div class="inputHolder">
									<select name="top" id="top"
										style="writing-mode: tb-lr; -webkit-writing-mode: vertical-lr;">
										<option value="3">  </option>
										<option value="2">  </option>
										<option value="1">  </option>
										<option value="0" selected="true"></option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="m1ln h100"> </div>
							</td>
							<td>
								<div class="inputHolder">
									<input type="text" name="doctitle" id="doctitle"
										value="<c:out value="${queryDocForm.doctitle}"/>" />
								</div>
							</td>
							<!--  
						    -->
						</tr>
						<tr>
							<td></td>
							<td>
								<div class="m1ln h100">
									&nbsp;&nbsp;<a href="javascript:search();"></a>
								</div>
							</td>
							<td>
								<div class="m1ln h100">
									&nbsp;&nbsp;<a href="javascript:clearQueryForm();"></a>
								</div>
							</td>

						</tr>
					</table>
				</div>
				<div class="  artlistcell"
					style="width: 840px; height: 598px; overflow: scroll;">
					<div class="artListcell acell1">
						<div class="anwsls1">
							<table>
								<tr>
									<th>
										<div class="artList"></div>
									</th>
									<th>
										<div class="artList"></div>
									</th>
									<th>
										<div class="artList"> </div>
									</th>
									<th>
										<div class="artList"></div>
									</th>

								</tr>
								<c:forEach items="${docs}" var="documentValue"
									varStatus="status">
									<tr>
										<td>
											<div class="artList" style="height: 310px;">
												<a
													<c:if test="${documentValue.doctype==1}">
			   href="getuserdocdetail.do?docid=<c:out value="${documentValue.docid}"/>"
			  </c:if>
													<c:if test="${documentValue.doctype==2}">
			   href="getimginfo.do?imgid=<c:out value="${documentValue.docid}"/>&userid=<c:out value="${documentValue.userid}"/>"
			   </c:if>>
													<c:out value="${documentValue.doctitle}" />
												</a>
											</div> <input type="hidden"
											id="title<c:out value="${documentValue.docid}"/>"
											value="<c:out value="${documentValue.doctitle}" />">
										</td>
										<td>
											<div class="artList" style="height: 100px;">
												<a
													href="gouserindex.do?userid=<c:out value="${documentValue.userid}" />"><c:out
														value="${documentValue.docauthor}" /></a>
											</div>
										</td>
										<td>
											<div class="artList">
												<a><c:out value="${documentValue.docRelTimeStr}" /></a>
											</div>
										</td>
										<td>
											<div class="artList">
												<c:if test="${documentValue.doctype==1}">
			    
			 </c:if>
												<c:if test="${documentValue.doctype==2}">
			     
			 </c:if>
											</div>
										</td>

									</tr>
								</c:forEach>
								<input type="hidden" name="docids" id="docids" />
							</table>
						</div>
						<div class="vpagenav">
							<input type="hidden" id="pageindex" name="pageindex" />
							<!-- 						<a href="#">1</a>&nbsp;...&nbsp;<a href="#">4</a>&nbsp;<span -->
							<!-- 							class="currentPage">5</span>&nbsp;<a href="#">6</a>&nbsp;...&nbsp;<a -->
							<!-- 							href="#">20</a> -->

							<span id="picbtn1"
								style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<a>&lt;</a>&nbsp;
							</span>
							<c:forEach items="${pagingindexs}" var="pagingindex"
								varStatus="status">
								<a
									href="javascript:gotoPage(<c:out value="${pagingindex.pageindex}"
										default="" />)"><c:if
										test="${pagingindex.doc==1}">
										<c:if test="${pagingindex.front==1}">									 
									 ..									 
									</c:if>
									</c:if> <c:if test="${pagingindex.current==1}">
										<span id="picbtn1"
											style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<c:out
												value="${pagingindex.pageindex}" default="" />&nbsp;
										</span>
									</c:if> <c:if test="${pagingindex.current==0}">
										<span id="picbtn1"
											style="cursor: pointer; border: 1px solid rgb(100, 100, 100); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<c:out
												value="${pagingindex.pageindex}" default="" />&nbsp;
										</span>
									</c:if> <c:if test="${pagingindex.doc==1}">
										<c:if test="${pagingindex.front==0}">									 
									 ..									 
									</c:if>

									</c:if> </a>
							</c:forEach>

							<span id="picbtn1"
								style="cursor: pointer; border: 1px solid rgb(204, 204, 204); display: inline-block; color: rgb(0, 0, 0); background-color: rgb(238, 238, 238); line-height: 15px; width: 15px;">&nbsp;<a>&gt;</a>&nbsp;
							</span> (
							<c:out value="${doccount}" default="0" />
							)
						</div>
					</div>
				</div>


			</div>
		</form>
	</div>
<!-- 	<div class="wrp m0a ribbon"></div> -->
<%@ include file="tail.jsp"%>
	<!-- 	<div class="lmainR ofh" style="text-align: center;"> -->
	<!-- 		<div class="tailCard"> -->
	<%-- 			<%@ include file="../website/tail.jsp"%> --%>
	<!-- 		</div> -->
	<!-- 		<div class="cbt"></div> -->
	<!-- 	</div> -->
</body>
</html>
