<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원가입페이지" />

<%@ include file="../part/head.jsp"%>


<div class="container m-auto flex justify-center">
	<form class="" action="doJoin" method="POST">
		<table >
			<colgroup>
				<col width="200px" />
				<col width="400px"  />
			</colgroup>
			<tbody>
				<tr>
					<th>LoginId</th>
					<td>
						<input class="w-full" name="loginId" type="text" placeholder="로그인 아이디를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<input class="w-full" name="loginPw" type="password" placeholder="로그인 비밀번호를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<input class="w-full" name="name" type="text" placeholder="이름을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>NickName</th>
					<td>
						<input class="w-full" name="nickName" type="text" placeholder="활동명을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Phone</th>
					<td>
						<input class="w-full" name="phoneNo" type="tel" placeholder="전화번호를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Emergency</th>
					<td>
						<input class="w-full" name="emergencyNo" type="tel" placeholder="비상연락망을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>address</th>
					<td>
						<input class="w-full" name="loginId" type="text" placeholder="주소를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input class="w-full" name="loginId" type="email" placeholder="이메일을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Job</th>
					<td>
						<input class="w-full" name="loginId" type="text" placeholder="직업을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Agency</th>
					<td>
						<input class="w-full" name="loginId" type="text" placeholder="소속사를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<th>Career</th>
					<td>
						<textarea class="w-full" name="loginId" type="text" placeholder="경력사항을 입력해주세요" /></textarea>
					</td>
				</tr>
				<tr>
					<th>전송</th>
					<td>
						<input class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" name="loginId"name="loginId" type="submit" value="전송" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<%@ include file="../part/foot.jsp"%>