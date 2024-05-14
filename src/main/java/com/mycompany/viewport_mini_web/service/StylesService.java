package com.mycompany.viewport_mini_web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.StylesDao;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Styles;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StylesService {
  @Autowired
  	StylesDao stylesDao; 
  

public void createStyles(Styles styles) {
	int rowNum = stylesDao.insert(styles);
	
}


public int getStylesTotalRows() {
	int totalStylesRows = stylesDao.count();
	return totalStylesRows;
}


public List<Styles> getStylesListByPager(Pager pager) {
	List<Styles> styles = stylesDao.selectStylesListByPager(pager);
	return styles;
}


public Styles getStyles(int stid) {
	Styles styles = stylesDao.selectByStid(stid);
	return styles;
}


}
