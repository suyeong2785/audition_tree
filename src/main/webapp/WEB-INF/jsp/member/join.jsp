<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원가입페이지" />

<%@ include file="../part/head.jsp"%>

<!-- lodash 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min.js"></script>

<script>
	const JoinForm__checkAndSubmitDone = false;

	function checkLoginIdDup() {
		const form = $('.formLogin').get(0);

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			return;
		}

		$.get('checkLoginIdDupAjax', {
			loginId : form.loginId.value
		}, function(data) {
			let colorClass = 'text-green-500';

			if (data.fail) {
				colorClass = 'text-red-500';
			}

			$('.loginIdDupResult').html(
					"<div class='"+ colorClass+ "'>" + data.msg + "</div>");

		}, 'json');
	}

	function JoinForm__checkAndSubmit(form) {
		if (JoinForm__checkAndSubmitDone) {
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('로그인 아이디를 입력해주세요');
			form.loginId.focus();

			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			alert('로그인 비밀번호를 입력해주세요');
			form.loginPw.focus();

			return;
		}

		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value.length == 0) {
			alert('로그인 비밀번호확인을 입력해주세요');
			form.loginPwConfirm.focus();

			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.다시입력해주세요');
			form.loginPwConfirm.focus();

			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요');
			form.name.focus();

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			alert('활동명을 입력해주세요');
			form.nickname.focus();

			return;
		}

		form.phoneNo.value = form.phoneNo.value.trim();

		if (form.phoneNo.value.length == 0) {
			alert('전화번호를 입력해주세요');
			form.phoneNo.focus();

			return;
		}

		form.emergencyNo.value = form.emergencyNo.value.trim();

		if (form.emergencyNo.value.length == 0) {
			alert('비상연락망을 입력해주세요');
			form.emergencyNo.focus();

			return;
		}

		form.address.value = form.address.value.trim();

		if (form.address.value.length == 0) {
			alert('주소를 입력해주세요');
			form.address.focus();

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요');
			form.email.focus();

			return;
		}

		form.job.value = form.job.value.trim();

		if (form.job.value.length == 0) {
			alert('직업을 입력해주세요');
			form.job.focus();

			return;
		}

		form.agency.value = form.agency.value.trim();

		if (form.agency.value.length == 0) {
			alert('소속사를 입력해주세요');
			form.agency.focus();

			return;
		}

		form.career.value = form.career.value.trim();

		if (form.career.value.length == 0) {
			alert('경력사항을 입력해주세요');
			form.career.focus();

			return;
		}

		const submitForm = function(data) {
			if (data) {
				form.genFileIdsStr.value = data.body.genFileIdsStr;
			}

			form.submit();
			JoinForm__checkAndSubmitDone = true;
		}
		function startUpload(onSuccess) {
			if (!form.file__member__0__common__attachment__1.value) {
				onSuccess();
				return;
			}

			const formData = new FormData(form);

			$.ajax({
				url : '/common/genFile/doUpload',
				data : formData,
				processData : false,
				contentType : false,
				dataType : "json",
				type : 'POST',
				success : onSuccess
			});

			// 파일을 업로드 한 후
			// 기다린다.
			// 응답을 받는다.
			// onSuccess를 실행한다.
		}

		startUpload(submitForm);
	}

	$(document).ready(function() {

		$('.inputLoginId').keyup(_.debounce(checkLoginIdDup, 500));

	});
</script>

<section class="section-login">
	<div
		class="container mx-auto min-h-screen flex items-center justify-center">
		<div class="w-full">
			<div class="logo-bar flex justify-center mt-3">
				<a href="#" class="logo">
					<span>
						<i class="fas fa-tree"></i>
					</span>
					<span>AUDITION TREE</span>
				</a>
			</div>
			<form
				class="formLogin bg-white shadow-md rounded px-8 pt-6 pb-8 mt-4"
				action="doJoin" method="POST"
				onsubmit="JoinForm__checkAndSubmit(this); return false;">
				<input type="hidden" name="genFileIdsStr" />


				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>로그인아이디</span>
					</div>

					<div class="p-1 md:flex-grow">
						<input
							class="inputLoginId shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							name="loginId" type="text" placeholder="로그인 아이디를 입력해주세요" />
						<span class="loginIdDupResult"></span>
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<th>비밀번호</th>
					</div>

					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker"
							name="loginPw" type="password" placeholder="로그인 비밀번호를 입력해주세요" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>비밀번호확인</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="password"
							placeholder="로그인 비밀번호확인을 입력해주세요." name="loginPwConfirm"
							maxlength="20" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>이름</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="text" placeholder="이름을 입력해주세요."
							name="name" maxlength="20" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>활동명</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="text" placeholder="활동명을 입력해주세요."
							name="nickname" maxlength="20" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>프로필이미지</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input accept="image/gif, image/jpeg, image/png"
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="file" placeholder="프로필이미지를 선택해주세요."
							name="file__member__0__common__attachment__1" maxlength="20" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>휴대전화번호</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="tel"
							placeholder="휴대전화번호를 입력해주세요.(- 없이 입력해주세요.)" name="phoneNo"
							maxlength="11" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>비상연락망</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="tel"
							placeholder="휴대전화번호를 입력해주세요.(- 없이 입력해주세요.)" name="emergencyNo"
							maxlength="11" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>주소</span>
					</div>
					<div class="p-1 md:flex-grow">

						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							type="text" id="address" name="address" placeholder="주소">
						<br>
						<div>
							<div class="flex">
								<input
									class="shadow appearance-none border rounded flex-grow py-2 px-3 text-grey-darker"
									type="text" id="detailAddres" placeholder="상세주소">
								<input
									class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
									type="button" onclick="sample3_execDaumPostcode()"
									value="우편번호 찾기">
							</div>

							<div id="wrap" class="flex flex-grow"
								style="display: none; border: 1px solid; height: 300px; margin: 5px 0; position: relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnFoldWrap"
									style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
									onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>



						</div>
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>이메일</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="email" placeholder="이메일을 입력해주세요."
							name="email" maxlength="100" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>직업</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="text" placeholder="별명을 입력해주세요."
							name="job" maxlength="100" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>소속사</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="text" placeholder="소속사를 입력해주세요."
							name="agency" maxlength="100" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>경력</span>
					</div>
					<div class="p-1 md:flex-grow">
						<input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker"
							autofocus="autofocus" type="text" placeholder="경력을 입력해주세요."
							name="career" maxlength="100" />
					</div>
				</div>
				<div class="flex flex-col mb-4 md:flex-row">
					<div class="p-1 md:w-36 md:flex md:items-center">
						<span>전송</span>
					</div>
					<div class="p-1">
						<input
							class="btn-primary bg-blue-500 hover:bg-blue-dark text-white font-bold py-2 px-4 rounded"
							type="submit" value="회원가입" />
						<a onclick="history.back();"
							class="btn-info bg-green-500 hover:bg-blue-dark text-white font-bold py-2 px-4 rounded inline-block">뒤로가기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode({
			oncomplete : function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}

				} else {
					document.getElementById("sample3_extraAddress").value = '';
				}

				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddres").focus();

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_wrap.style.display = 'none';

				// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
				document.body.scrollTop = currentScroll;
			},
			// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
			onresize : function(size) {
				element_wrap.style.height = size.height + 'px';
			},
			width : '100%',
			height : '100%'
		}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>
<%@ include file="../part/foot.jsp"%>