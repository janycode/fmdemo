package com.fengmi.entity;

import java.util.List;

public class PageBean<T> {
	private Integer currentPage; 	// 当前页码
	private Integer totalPage; 		// 总页数
	private Integer pageSize = 10; // 每页显示条数
	private Integer totalSize; 		// 总条数
	private List<T> pageList;		// 页详细数据

	public PageBean() {
		super();
	}

	public PageBean(Integer currentPage, Integer totalPage, Integer pageSize, Integer totalSize, List<T> pageList) {
		super();
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.pageSize = pageSize;
		this.totalSize = totalSize;
		this.pageList = pageList;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Integer totalSize) {
		this.totalSize = totalSize;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

	@Override
	public String toString() {
		return "PageBean [currentPage=" + currentPage + ", totalPage=" + totalPage + ", pageSize=" + pageSize
				+ ", totalSize=" + totalSize + ", pageList=" + pageList + "]";
	}
}