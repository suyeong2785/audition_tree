package com.quantom.audition_tree.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String delDate;
	private String delStatus;
	private String name;
	private String nickname;
	private String loginId;
	private String loginPw;
	private String emergencyCall;
	private String email;
	private String address;
	private String phoneNo;
	private String job;
	private int artworkId;
	private String career;
	private String agency;
	
	
}
