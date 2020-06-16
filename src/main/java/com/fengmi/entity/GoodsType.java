package com.fengmi.entity;

public class GoodsType {
	private Integer id;
	private String typename;

	public GoodsType() {
		super();
	}

	public GoodsType(Integer id, String typename) {
		super();
		this.id = id;
		this.typename = typename;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	@Override
	public String toString() {
		return "GoodsType [id=" + id + ", typename=" + typename + "]";
	}
}
