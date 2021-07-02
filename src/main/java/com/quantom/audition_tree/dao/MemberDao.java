package com.quantom.audition_tree.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.quantom.audition_tree.dto.Member;

@Mapper
public interface MemberDao {

	List<Member> getMembers();

	void doJoin(Map<String, Object> param);

	Member getMemberByLoginId(String loginId);
	
}
