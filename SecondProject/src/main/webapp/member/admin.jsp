<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://unpkg.com/chart.js@3.0.2"></script>
<script src="https://unpkg.com/chartjs-adapter-date-fns@2.0.0/dist/chartjs-adapter-date-fns.bundle.js"></script>
<script src="https://unpkg.com/chartkick@4.0.2"></script>
<script src="https://unpkg.com/vue-chartkick@1.1.0"></script>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="https://unpkg.com/vue-chartjs/dist/vue-chartjs.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* $(function(){
	$('#letsfind').click(function(){
		
		let ss= $('#ss').val();
		let data=$('#data').val();
		
		  $.ajax({
			type:'post',
			url:'member_find.do',
			data:{"ss":ss, "data":data},
			success:function(result)
			{
				console.log("ajaxsuccess")
				 let json=JSON.parse(result);
				let memdata=""; 
				
				 for(let i=0; i<json.length; i++)
				{
					 console.log(12345)
					 
					 memdata+='<table class=table width=100%>'
						 	+'<tr>'
								+'<td calss="uid" width=10%>'+json[i].id+ '</td>'
								+'<td calss="text-center" width=15%>'+json[i].name+ '</td>'
								
								+'<td calss="text-center" width=10%>'+json[i].sex+ '</td>'
								+'<td calss="text-center" width=20%>'+json[i].email+ '</td>'
								+'<td calss="text-center" width=25%>'+json[i].address+ '</td>'
								+'<td calss="text-center" width=20%>'+json[i].tel+ '</td>'
							+'</tr>'
							+'</table>'
				} 
				$('#memcontainer').html(memdata);
			
				 $('#memcontainer td').click(function(){
					 
					 let test_point = $(this)
					 id_data=test_point.text();
						console.log('id_data :'+id_data)
					 	
					 
						
					 
				}) 
			} 
		})  
		
	})
}); */
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category" style="height:150px;">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>관리자 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#"></a></li>
              <li class="breadcrumb-item active" aria-current="page">회원관리</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        <div class="returning_customer">
            <div class="check_title">
                <h2>회원 정보 조회 </h2>
            </div>
            
        </div>
        <div class="cupon_area">
            <div class="mycontainer">
            	<div class="search_row" width=100%>
            	
            		<table class="table">
       					<tr>
            				<td style="width:30px; margin-top:px;" valign="middle">
            				<select class="member_type" style="margin-top:25px;" id="data" v-model="stype">
            					<option value="id">아이디</option>
            					<option value="name">이름</option>
            					<option value="idname">아이디+이름</option>
            				</select>
            				</td>
            				<td><input type="text" id="ss"  class="input-sm"  width=40% style="margin-bottom:10px;" v-model="ss"></td>
            				<td style="margin-left: 10px;"><button id="letsfind" class="btn btn-sm btn-primary" style="margin-left: 20px; margin-top:25px;" v-on:click="memberFound">검색</button></td>
            			</tr>
            		</table>
            	
            	</div>
            	<div>
            	<div class="member_container" style="margin:0px auto;">
            			<table width=100%>
            			
            			<tr class="text-center">	
            				<th calss="text-center" width=10%>ID</th>
            				<th calss="text-center" width=15%>이름</th>
            				<th calss="text-center" width=10%>성별</th>
            				<th calss="text-center" width=20%>Email</th>
            				<th calss="text-center" width=25%>주소</th>
            				<th calss="text-center" width=20%>전화번호</th>
            			</tr>
            			
            			
            			<%-- <c:forEach var="mvo" items="${mList }">
            				<tr>
            					<td>${mvo.id }</td>
            					<td>${mvo.name }</td>
            					<td>${mvo.sex }</td>
            					<td>${mvo.email }</td>
            					<td>${mvo.addr1 }</td>
            					<td>${mvo.tel }</td>
            				</tr>
            				<a href=""><button class="btn btn-sm btn warning">회원탈퇴</button></a>
            			</c:forEach> --%>
            			
            		</table>
            		<div class="container-fluid" id="memcontainer" style="margin:0px auto;">
            		</div>
            		<div class="container" id="membercontainer">
            		
            		</div>
            		</div>
            	</div>
            	<div class="" >
            		<table class="table">
            			<tr>
            			  
            			</tr>
            		</table>
            	</div>
            	<div class="check_title" style="text-align:center;">
                <h2 style="text-align:center;">회원 정보 </h2>
            </div>    
            <div class="printmembers" style="height:100px;" v-for="vo in member_data">
            	<table class="table">
            		<tr style="margin:0px auto;" v-on:click="checkedData(vo.id)">
            		   <td calss="text-center">{{vo.id}}</td>
            		   <td calss="text-center">{{vo.name}}</td>
            		   <td calss="text-center">{{vo.sex}}</td>
            	   	   <td calss="text-center">{{vo.email}}</td>
            		   <td calss="text-center">{{vo.addr1}}</td>
            		   <td calss="text-center">{{vo.tel}}</td>
            		   <td><button class="btn btn-sm btn-danger" v-on:click="memberDelete(vo.id)">탈퇴</button></td>
            		</tr>            	
            	</table>
            </div>
            <div>
            	
            	
            
            </div>
        
            
            </div>
        
        </div>
           </div>
    <script>
    new Vue({
    	el:'.mycontainer',
    	data:{
    		ss:'',
    		stype:'id',
    		id:'',
    		member_data:[],
    		chart_data:[],
    		member_detail:{}
    		
    	},
    	mounted:function(){
    		let _this=this;
    		//console.log(12345);
    		//console.log(_this);
    		
    	},
    	methods:{
    		
    		memberFdData:function(){
    			let _this=this;
    		//	console.log(this.ss);
    		//	console.log(this.stype);
    			axios.get("http://211.238.142.211/main/member/member_find.do",{
    				params:{
    					ss:_this.ss,
    					stype:_this.stype
    				}
    			}).then(function(response){
    				_this.member_data=response.data;
    				console.log(response.data);
    				
    			})
    		},
    		memberFound:function(){
    			this.memberFdData();
    			console.log(1234)
    		},
    		memberDelete:function(id){
    			let _this=this;
    		//	console.log(12345555555)
    		//	console.log(id)
    			axios.get("http://211.238.142.211/main/member/delete.do",{
    				params:{
						id:id 					
						
    				}
    			}).then(function(response){
    				
    			})
    	
    		},
	    	
    		
    		
    		checkedData:function(id){
    			let this_=this;
    			
    			axios.get("http://211.238.142.211/main/member/admin_mem.do",{
    				params:{
    					id:id		
    				}
    			
    			}).then(function(response){
    				this_.chart_data=response.data
    				
    				console.log(response.data);
    				
    			})
    		}
    		
	    
    	}
    	
    	
    })
     new Vue({
    	el:'.testcontainer',
    	data:{
    		recommed:[],
    		id:''
    	},
    	mounted:function(){
    		console.log('test mounted');
    		this.videoListed()
    	},
    	 methods:{
    		
    		videoListed:function(){
    			let ttis=this;
    			console.log('testfunction');
    			console.log('testttis  '+this);
    			axios.get("http://211.238.142.211/main/main/mainrecom.do",{
    				params:{
    					
    				}
    			}).then(function(response){
    				ttis.recommed=response.data
    				//console.log(response.data);
    				
    			})
    			
    		}
    	} 
    
    }) 
    
    </script>
  </section>
  <!--================End Checkout Area =================-->
</body>

</html>