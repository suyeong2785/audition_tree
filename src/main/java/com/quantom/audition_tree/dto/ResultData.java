package com.quantom.audition_tree.dto;

import java.util.Map;

import com.quantom.audition_tree.util.Util;

import lombok.Data;

@Data
public class ResultData {
	private String resultCode;
	private String msg;
	private Map<String, Object> body;

	public ResultData(String resultCode, String msg, Object...args) {
		this.resultCode = resultCode;
		this.msg = msg;
		this.body = Util.mapOf(args);
	}

	public boolean isFail() {
		return isSuccess() == false;
	}

	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}

}
