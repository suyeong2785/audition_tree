package com.quantom.audition_tree.dto;

import lombok.Data;

@Data
public class ResultData {
	private String resultCode;
	private String msg;
	private Object body;
	
	public ResultData(String resultCode, String msg) {
		this(resultCode, msg, null);
	}

	public ResultData(String resultCode, String msg, Object body) {
		this.resultCode = resultCode;
		this.msg = msg;
		this.body = body;
	}

	public boolean isFail() {
		return isSuccess() == false;
	}

	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}

}
