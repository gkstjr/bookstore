<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container" id = "app">
            <div class="row" >
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                         <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan = "2">상품정보</th>
                                    <th>판매가</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th>선택</th>
                                </tr>
                            </thead>
                            <tbody>
                            	
                                
                                <tr v-for = "(basket, index) dataList" v-bind:key="index">
                                <!-- 책 이미지 보여주는 칸 -->
                                    <td class="shoping__cart__item">
<!-- 									<img src="{{basket.basketBookImage }}"> -->
								</td>
                                    <!-- 책제목 보여주는 칸 -->
                                  	<td  style = "text-align:left" width = "40%">
<!-- 										<h5>{{basket.basketBookTitle}}</h5> -->
                                  	</td>  
                                    <td class="shoping__cart__price">
                                       <h5>{{basket.basketPrice}}</h5>                                   
                                        </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>{{basket.basketAmount}}</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class = "shoping_cart_quantity">
                                    	<h5>수량</h5>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <h5>선택 버튼</h5>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
    
    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
   <!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
   <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    dataList:[],
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
    		created(){
//     			ajax 통신을 사용하여 exam list를 불러온다
//     			1. jquery ajax를 이용하는 방법
//     			const that = this;
//     			$.ajax({
//     				url:"${pageContext.request.contextPath}/rest/exam/",
//     				type:"get",
//     				dataType:"json",
//     				success:function(resp){
//     					//for(let i=0; i < resp.length; i++){
//     					//	that.dataList.push(resp[i]);
//     					//}
//     					that.dataList.push(...resp);//javascript 전개 연산자(ES6)
//     				},
//     				error:function(e){
//     					console.log("error");
//     				},
//     			});
    			
//     			2. axios 이용하는 방법
//     			axios({옵션}).then(성공콜백).catch(에러콜백);
    				axios({
    					url:"${pageContext.request.contextPath}/rest/basket/",
    					method:"get"
    				})
    				.then((resp)=>{
    					//console.log(resp);
    					//console.log(resp.data);
    					this.dataList.push(...resp.data);
    				})
    		},
        });
        app.mount("#app");
    </script>
    
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    