package com.mycompany.viewport_mini_web.service;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dto.Pager;

@Service
public class PagerService {
  
  public Pager preparePager(HttpSession session, String pageNo, int totalRows, int rowsPerPage,
      int pagesPerGroup) {
    if (pageNo == null) {
      pageNo = (String) session.getAttribute("pageNo");
      if (pageNo == null) {
        pageNo = "1";
      }
    }

    session.setAttribute("pageNo", pageNo);
    int intPageNo = Integer.parseInt(pageNo);
    return new Pager(rowsPerPage, pagesPerGroup, totalRows, intPageNo);
  }
}
