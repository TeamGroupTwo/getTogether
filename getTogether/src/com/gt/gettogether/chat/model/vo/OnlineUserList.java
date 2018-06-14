package com.gt.gettogether.chat.model.vo;

import java.io.Serializable;
import java.util.*;

import com.gt.gettogether.employee.model.vo.Employee;

public class OnlineUserList implements Serializable {

	private static final long serialVersionUID = 992L;
	
	private static HashSet<Employee> onlineList = new HashSet<Employee>(); // 채팅 온라인 접속자 체크용 변수

	public OnlineUserList() { }

	public static HashSet<Employee> getInstance(){
		return onlineList;
	}
	
	public static int onlineListSize() {
		return onlineList.size();
	}

	public static void addEmployee(Employee e){
		onlineList.add(e);
	}
	
	public static void delEmployee(Employee e){
		onlineList.remove(e);
	}

	public static ArrayList<Employee> memberSearch(String keyword){
		
		ArrayList<Employee> empList = new ArrayList<Employee>();
		
		if(keyword == null) empList.addAll(onlineList);
		else {
			for(Employee e : onlineList) {
				if(e.geteName().contains(keyword)) empList.add(e);
			}
		}		
		return empList;
	}
	
	@Override
	public String toString() {
		return "OnlineUserList [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}	
}