package com.to.t1.favoriteToon;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FavoritetoonVO {
	private long toonNum;
	private String username;
	private long likeClick;
	private Timestamp likeDate;
}
