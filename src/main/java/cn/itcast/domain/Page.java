package cn.itcast.domain;

import java.util.List;

public class Page<T> {
	//��ҳ������
    private int pageTotal = 10;
    //��������
    private int dateTotal;
    //ҳ��
    private int pageCount;
    //��ǰҳ��
    private int currentPage = 1;
    //���ڴ����ѯ������
    private List<T> pages;

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        if (pageTotal < 0) {
            return;
        }
        this.pageTotal = pageTotal;
        if(this.dateTotal % pageTotal == 0) {
            pageCount = dateTotal / this.pageTotal;
        } else {
            pageCount = dateTotal / this.pageTotal + 1;
        }
    }

    public int getDateTotal() {
        return dateTotal;
    }

    public void setDateTotal(int dateTotal) {
        if (dateTotal < 0) {
            return;
        }
        this.dateTotal = dateTotal;
        if(this.dateTotal % pageTotal == 0) {
            pageCount = this.dateTotal / pageTotal;
        } else {
            pageCount = this.dateTotal / pageTotal + 1;
        }
    }

    public int getPageCount() {
        return pageCount;
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
