package cn.itcast.domain;

import java.util.List;

public class Pages<T> {
	//总页数
    private int pageTotal;
    //数据总数
    private int dataTotal;
    //每页数据量
    private int pageCount = 1;
    //当前页面
    private int currentPage = 1;
    //当前页的数据
    private List<T> pages;
    
	public int getPageTotal() {
		return pageTotal;
	}

	public int getDataTotal() {
		return dataTotal;
	}
	
	public void setDataTotal(int dataTotal) {
		if(dataTotal <= 0) {
			return;
		}
		this.dataTotal = dataTotal;
		//求总页数
		this.pageTotal = this.dataTotal % this.pageCount == 0 ?
				this.dataTotal / this.pageCount : this.dataTotal / this.pageCount + 1;
		
	}
	
	public int getPageCount() {
		return pageCount;
	}
	
	public void setPageCount(int pageCount) {
		if(pageCount <= 0) {
			return;
		}
		this.pageCount = pageCount;
		//求总页数
		this.pageTotal = this.dataTotal % this.pageCount == 0 ?
				this.dataTotal / this.pageCount : this.dataTotal / this.pageCount + 1;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		if(currentPage <= 0) {
			return;
		}
		this.currentPage = currentPage;
	}
	
	public List<T> getPages() {
		return pages;
	}
	
	public void setPages(List<T> pages) {
		this.pages = pages;
	}
    
    
}