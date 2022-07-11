<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>배송 관리 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/bookstore/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<div class="row float-container mt-1" id="app">

		<div class="float-left" style="width:100%">
			<table class="table table-border">
				<thead>
					<tr>
						<th>아이디</th>
						<th>닉네임</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>포인트</th>
						<th>등급</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(member, index) in memberList" v-bind:key="index">
						<td>{{member.memberId}}</td>
						<td>{{member.memberNick}}</td>
						<td>{{member.memberPhone}}</td>
						<td>{{member.memberEmail}}</td>
						<td>{{member.memberPoint}}</td>
						<td>{{member.memberGrade}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	const app = Vue.createApp({
		data(){
			return {
				memberList:[],
				
				currentData:{
					memberId:"",
					memberNick:"",
					memberPhone:"",
					memberEmail:"",
					memberPoint:"",
					memberGrade:"",
				},
			};
		},
		computed:{

		},
		methods:{

		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/member/",
					method:"get"
				})
				.then((resp)=>{
					console.log(resp.data);
					this.memberList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>