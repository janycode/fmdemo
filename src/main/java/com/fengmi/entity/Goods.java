package com.fengmi.entity;

import java.util.Date;

public class Goods {
	private Integer id;
	private String goodsName;
	private Double price;
	private String imgPath;
	private Date deployDate;
	private String description;
	private Integer typeId;
	private GoodsType goodsType;

	public Goods() {
		super();
	}

	public Goods(Integer id, String goodsName, Double price, String imgPath, Date deployDate, String description,
			Integer typeId) {
		super();
		this.id = id;
		this.goodsName = goodsName;
		this.price = price;
		this.imgPath = imgPath;
		this.deployDate = deployDate;
		this.description = description;
		this.typeId = typeId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public java.util.Date getDeployDate() {
		return deployDate;
	}

	public void setDeployDate(java.util.Date deployDate) {
		this.deployDate = deployDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public GoodsType getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	@Override
	public String toString() {
		return "Goods{" +
				"id=" + id +
				", goodsName='" + goodsName + '\'' +
				", price=" + price +
				", imgPath='" + imgPath + '\'' +
				", deployDate=" + deployDate +
				", description='" + description + '\'' +
				", typeId=" + typeId +
				", goodsType=" + goodsType +
				'}';
	}
}
