package com.gt.gettogether.chat.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * 
 * 각각의 채팅방 세부 정보를 담기 위한 Vo 클래스
 *
 */
public class ChatRoom implements Serializable{

	private static final long serialVersionUID = 991L;

	private String roomName; // 방 제목
	private ArrayList<String> allUser = new ArrayList<String>(); // 전체 인원
	private ArrayList<String> currUser = new ArrayList<String>(); // 현 인원
	private String chatContent; // 만약 채팅의 내용을 담고 싶다면 이걸 사용하세요.
	
	public ChatRoom() {	}
	
	public ChatRoom(String roomName) {
		super();
		this.roomName = roomName;
	}

	public ChatRoom(String roomName, ArrayList<String> allUser, ArrayList<String> currUser) {
		super();
		this.roomName = roomName;
		this.allUser = allUser;
		this.currUser = currUser;
	}
	
	public ChatRoom(String roomName, ArrayList<String> allUser, ArrayList<String> currUser, String chatContent) {
		super();
		this.roomName = roomName;
		this.allUser = allUser;
		this.currUser = currUser;
		this.chatContent = chatContent;
	}
	
	public int size() {
		return currUser.size();
	}

	@Override
	public String toString() {
		return "ChatRoom [roomName=" + roomName + ", allUser=" + allUser + ", currUser=" + currUser + ", chatContent="
				+ chatContent + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((allUser == null) ? 0 : allUser.hashCode());
		result = prime * result + ((chatContent == null) ? 0 : chatContent.hashCode());
		result = prime * result + ((currUser == null) ? 0 : currUser.hashCode());
		result = prime * result + ((roomName == null) ? 0 : roomName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChatRoom other = (ChatRoom) obj;
		if (allUser == null) {
			if (other.allUser != null)
				return false;
		} else if (!allUser.equals(other.allUser))
			return false;
		if (chatContent == null) {
			if (other.chatContent != null)
				return false;
		} else if (!chatContent.equals(other.chatContent))
			return false;
		if (currUser == null) {
			if (other.currUser != null)
				return false;
		} else if (!currUser.equals(other.currUser))
			return false;
		if (roomName == null) {
			if (other.roomName != null)
				return false;
		} else if (!roomName.equals(other.roomName))
			return false;
		return true;
	}

	/**
	 * @return the roomName
	 */
	public String getRoomName() {
		return roomName;
	}

	/**
	 * @param roomName the roomName to set
	 */
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	/**
	 * @return the allUser
	 */
	public ArrayList<String> getAllUser() {
		return allUser;
	}

	/**
	 * @param allUser the allUser to set
	 */
	public void setAllUser(ArrayList<String> allUser) {
		this.allUser = allUser;
	}

	/**
	 * @return the currUser
	 */
	public ArrayList<String> getCurrUser() {
		return currUser;
	}

	/**
	 * @param currUser the currUser to set
	 */
	public void setCurrUser(ArrayList<String> currUser) {
		this.currUser = currUser;
	}

	/**
	 * @return the chatContent
	 */
	public String getChatContent() {
		return chatContent;
	}

	/**
	 * @param chatContent the chatContent to set
	 */
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
}
