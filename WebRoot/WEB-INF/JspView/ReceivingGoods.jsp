<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>购物车</title>

		<link rel="stylesheet" type="text/css" href="css/style1.css">
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

		<script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/list.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		
		<script type="text/javascript">
			$(function() {
				var region = $("#region");
				var address = $("#address");
				var number_this = $("#number_this");
				var name = $("#name_");
				var phone = $("#phone");
				$("#sub_setID").click(function() {
					var input_out = $(".input_style");
					for (var i = 0; i <= input_out.length; i++) {
						if ($(input_out[i]).val() == "") {
							$(input_out[i]).css("border", "1px solid red");
							
							return false;
						} else {
							$(input_out[i]).css("border", "1px solid #cccccc");
						}
					}
				});
				var span_momey = $(".span_momey");
				var b = 0;
				for (var i = 0; i < span_momey.length; i++) {
					b += parseFloat($(span_momey[i]).html());
				}
				var out_momey = $(".out_momey");
				out_momey.html(b);
				$(".shade_content").hide();
				$(".shade").hide();
				$('.nav_mini ul li').hover(function() {
					$(this).find('.two_nav').show(100);
				}, function() {
					$(this).find('.two_nav').hide(100);
				})
				$('.left_nav').hover(function() {
					$(this).find('.nav_mini').show(100);
				}, function() {
					$(this).find('.nav_mini').hide(100);
				})
				$('#jia').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
				})
				$('#jian').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
				})
				$('.Caddress .add_mi').click(function() {
					$(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat')
				})
			})
			var x = Array();

			function func(a, b) {
				x[b] = a.html();
				alert(x)
				a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
			}

			function onclick_close() {
				var shade_content = $(".shade_content");
				var shade = $(".shade");
				if (confirm("确认关闭么！此操作不可恢复")) {
					shade_content.hide();
					shade.hide();
				}
			}

			function onclick_open() {
				$(".shade_content").show();
				$(".shade").show();
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() != "") {
						$(input_out[i]).val("");
					}
				}
			}

			function onclick_remove(r) {
				if (confirm("确认删除么！此操作不可恢复")) {
					var out_momey = $(".out_momey");
					var input_val = $(r).parent().prev().children().eq(1).val();
					var span_html = $(r).parent().prev().prev().children().html();
					var out_add = parseFloat(input_val).toFixed(2) * parseFloat(span_html).toFixed(2);
					var reduce = parseFloat(out_momey.html()).toFixed(2)- parseFloat(out_add).toFixed(2);
					console.log(parseFloat(reduce).toFixed(2));
					out_momey.text(parseFloat(reduce).toFixed(2))
					$(r).parent().parent().remove();
				}
			}

			function onclick_btnAdd(a) {
				var out_momey = $(".out_momey");
				var input_ = $(a).prev();
				var input_val = $(a).prev().val();
				var input_add = parseInt(input_val) + 1;
				input_.val(input_add);
				var btn_momey = parseFloat($(a).parent().prev().children().html());
				var out_momey_float = parseFloat(out_momey.html()) + btn_momey;
				out_momey.text(out_momey_float.toFixed(2));
				
			}

			function onclick_reduce(b) {
				var out_momey = $(".out_momey");
				var input_ = $(b).next();
				var input_val = $(b).next().val();
				if (input_val <= 1) {
					alert("商品个数不能小于1！")
				} else {
					var input_add = parseInt(input_val) - 1;
					input_.val(input_add);
					var btn_momey = parseFloat($(b).parent().prev().children().html());
					var out_momey_float = parseFloat(out_momey.html()) - btn_momey;
					out_momey.text(out_momey_float.toFixed(2));
				
					
				}
			}
		</script>


	
	</head>

	<body>

 <c:import url="./head.jsp"></c:import> 






		<!-- 搜索区域开始 -->
		
		<div class="Caddress">
			<div class="open_new">
				<button class="open_btn" onclick="javascript:onclick_open();">使用新地址</button>
			</div>
			<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">重庆涪陵(丁亚东收)</p>
				<p>重庆涪陵长江师范学院北门弘马公寓B205</p>
			</div>
				<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">重庆涪陵(丁亚东收)</p>
				<p>重庆涪陵长江师范学院北门弘马公寓B205</p>
			</div>	<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">重庆涪陵(丁亚东收)</p>
				<p>重庆涪陵长江师范学院北门弘马公寓B205</p>
			</div>	<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">重庆涪陵(丁亚东收)</p>
				<p>重庆涪陵长江师范学院北门弘马公寓B205</p>
			</div>	<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">重庆涪陵(丁亚东收)</p>
				<p>重庆涪陵长江师范学院北门弘马公寓B205</p>
			</div>
		</div>

<form action="createOrder" method="get">
		<div class="shopping_content">
			<div class="shopping_table">
				<table class="am-table am-table-bordered am-table-radius am-table-striped "  border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center; ">
					<tr>
						<th style="text-align:center;vertical-align:middle;">商品图片</th>
						<th style="text-align:center;vertical-align:middle;">商品名称</th>
						<th style="text-align:center;vertical-align:middle;">商品简介</th>
						<th style="text-align:center;vertical-align:middle;">商品价格</th>
						<th style="text-align:center;vertical-align:middle;">商品数量</th>
						<th style="text-align:center;vertical-align:middle;">商品操作</th>
					</tr>



					<c:forEach items="${ois}" var="oi"  varStatus="status1">
					
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							<a href="ProductIntroductionServlet?id=${oi.book.id}"><img style="width: 150px;" src="image/${oi.book.img }" /></a>
						</td>
						<td style="text-align:center;vertical-align:middle;"><span>${oi.book.name}</span></td>
						<td style="text-align:center;vertical-align:middle;">
							<div class="" style="white-space:normal; word-break:break-all;overflow:hidden;">
								${oi.book.bookqutline}
							</div>
							
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
							¥<span class="span_momey">${oi.book.price}</span>
						</td>
						<td style="text-align:center;vertical-align:middle;">
					
						
							<input name="pid" type="hidden"   value="${oi.book.id}"/>
							<input type="button" class="btn_reduce" value="-" onclick="javascript:onclick_reduce(this);"/>
							<input name="num" class="momey_input" type="text"  value="${oi.num}" />
							<input type="button" class="btn_add" value="+" onclick="javascript:onclick_btnAdd(this);"/>
							
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<a href="./OrderIteamDeleteServlet?id=${status1.index}">删除</a>
						</td>
					</tr>
				</c:forEach>
				</table>
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<div class="div_outMumey" style="float: left;">
						总价：<span class="out_momey">11</span>
					</div>
					<input type="submit" class="am-btn am-btn-danger" value="结算"/>
								</div>
								</div>
							</div>
					</form>
	


		<div class="shade">
		</div>

			<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<form action="" method="post">
						<div class="col-xs-12">
							<span class="span_style" id="">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
							<input class="input_style" type="" name="" id="region" value="" placeholder="&nbsp;&nbsp;请输入您的所在地区" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">详细地址</span>
							<input class="input_style" type="" name="" id="address" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">邮政编号</span>
							<input class="input_style" type="" name="" id="number_this" value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="input_style" type="" name="" id="name_" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style" type="" name="" id="phone" value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="submit" class="sub_set" id="sub_setID" value="提交" />
						</div>
					</form>
				</div>
			</div>
		</div>
  <br/><br/><br/>

	</body>

</html>