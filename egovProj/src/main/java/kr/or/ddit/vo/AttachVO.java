package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AttachVO {
	
	private String userNo;
	private int seq;
	private String fileName;
	private int fileSize; 
	private Date regDate;
	
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "AttachVO [userNo=" + userNo + ", seq=" + seq + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", regDate=" + regDate + "]";
	}
	
	
	
}
