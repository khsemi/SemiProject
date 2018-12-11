<%@page import="semi.KHC.userDto.UserDto"%>
<%@page import="semi.KHC.calendarDto.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.KHC.calendarDao.CalDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="semi.KHC.calendarDao.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

   #calendar{
      border-collapse : collapse;
      border : 1px solid gray;
   }
   #calendar th{
      width: 80px;
      border : 1px solid gray;
   }
   #calendar td{
   width : 80px;
   height : 80px;
   border  :1px solid gray;
   text-align :left;
   vertical-align : top;
   position : relative;
   }
   a{
      text-decoration : none;
   }
   
   .f > p{ 
      font-size:10px;
      margin:1px;
      background-color : skyblue;
   }
   .cPreview{
      position:absolute;
      top:-30px;
      left:10px;
      background-color:yellow;
      width:40px;
      height:40px;
      text-align:center;
      line-height:40px;
      border-radius:40px 40px 40px 1px;
      
   }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


$(function(){
   $(".countView").hover(
      function(){
         var aCountView = $(this);
         var year = $(".y").text().trim();
         var month=$(".m").text().trim();
         var cDate = aCountView.text().trim();
         var yyyyMMdd= year +isTwo(month) + isTwo(cDate);
         
         
         $.ajax({
                  url:"CalListCountAjax.do",
                  type: "post",
                  data:"user_seq=1&yyyyMMdd="+yyyyMMdd, 
                  async: false,
                  datatype: "json",
                  success: function(msg){
                     var count = JSON.parse(msg);
                     aCountView.after("<div class='cPreview'>"+count.calCount+"</div>");   
                     
                  },
            error:function(){
               alert("통신 오류");
            }
         });
      },
      function(){
         $(".cPreview").remove();
      }
      );
});

function isTwo(n){
   return (n.length<2)?"0"+n:n;
}
</script>
</head>

<%
   Calendar cal = Calendar.getInstance();
   int year = cal.get(Calendar.YEAR);
   int month=cal.get(Calendar.MONTH)+1;
   
   String paramYear = request.getParameter("year");
   String paramMonth = request.getParameter("month");
   if(paramYear !=null){
      year = Integer.parseInt(paramYear);
   }if(paramMonth !=null){
      month=Integer.parseInt(paramMonth);
   }
   if(month>12){
      year++;
      month=1;
   }if(month<1){
      year--;
      month=12;
   }
   cal.set(year,month-1,1);
   
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
   int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   
   CalDao dao = new CalDao();
   String yyyyMM = year + Util.istwo(String.valueOf(month));
   
   
   UserDto userdto = (UserDto) session.getAttribute("userDto");

   List<CalDto> clist = dao.getCalViewList(1,yyyyMM);
%>
<body>
<div class="layout-container" >
   <jsp:include page="khc_mypage.jsp" />
      <div id="main">
   <table id="calendar" class="table" style="text-align:center; border:1px; solid #dddddd;"> 
      <caption style="text-align:center">
         <a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◁</a>
         <a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
         <span class="y"><%=year %></span>년   
         <span class="m"><%=month %></span>월
         <a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
         <a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▷</a>
      </caption>
      
      <tr>
         <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
      </tr>   
   
      <tr>
       
         <% //공백    
         int count=0;
         for(int i=0;i<dayOfWeek-1;i++){
            out.print("<td>&nbsp;</td>");
            count++;
         }
         
         for(int i=1;i<=lastDay;i++){ 
            
         %>
               <td>
                  <a class="countView" href="controller.do?category=callist&year=<%=year %>&month=<%=month %>&date=<%=i %>" style="color:<%=Util.fontColor(i,dayOfWeek)%>"><%=i %></a>
               
                  <a href="insertcalboard.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>"><img alt="일정추가" src="img/ooo.png"></a>
                  <div class="clist">
                  <p>a<%=i %>, <%=clist %></p>
                  
                        <%=Util.getCalView(i,clist) %>
                  </div>
               </td>
         <%
            count++;
            if(count%7==0){
               out.println("</tr><tr>");
            }
         }
         
         //dayOfWeek-1+lastDay)%7 : 마지막 날의 요일
         //7-(dayOfWeek-1+lastDay)%7 : 남은 칸 수
         for(int i=0;i<(7-(dayOfWeek-1+lastDay)%7)%7;i++){
            out.print("<td>&nbsp</td>");
         }
         
         %>
      
      
      
      
      </tr>
   
   
   
   
   </table>
   </div>
   </div>
      
   
</body>
</html>