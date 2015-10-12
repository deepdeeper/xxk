package com.lzzyyy.xxk.user.exception;

@SuppressWarnings("serial")
public class LoginFaileException extends Exception {

	private String message;

	@Override
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LoginFaileException(String message) {

		super(message);
		this.message = message;
	}
}
