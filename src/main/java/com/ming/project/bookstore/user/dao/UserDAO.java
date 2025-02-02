package com.ming.project.bookstore.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.bookstore.user.model.NonMember;
import com.ming.project.bookstore.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	public int countLoginId(@Param("loginId") String loginId);
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public User selectUserByUserId(@Param("userId") int userId);
	
	public User selectUserLoginId(
			@Param("name") String name
			, @Param("email") String email);
	
	public int selectCountUserPassword(
			@Param("loginId") String loginId
			, @Param("email") String email);
	
	public User selectUserPassword(
			@Param("loginId") String loginId
			, @Param("email") String email);
	
	public int updateUserPassword(
			@Param("id") int id
			, @Param("password") String password);
	
	public User selectUserByPassword(@Param("password") String password);
	
	// 비회원
	
	public int insertNonMemberInfo(NonMember nonMember);
	
	public NonMember selectNonMember(@Param("id") int id);
	
	public NonMember selectNonMemberByName(
			@Param("name") String name
			, @Param("email") String email
			, @Param("password") String password);

	public NonMember selectNonMemberPassword(
			@Param("name") String name
			, @Param("email") String email);
	
	public int updateNonMemberPassword(
			@Param("nonMemberId") int nonMemberId
			, @Param("password") String password);
}
