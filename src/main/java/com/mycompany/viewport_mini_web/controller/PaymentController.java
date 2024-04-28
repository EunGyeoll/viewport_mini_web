package com.mycompany.viewport_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {
	@RequestMapping("/payment")
	public String payment() {
		log.info("payment() 실행");
		log.info("this is test");
		return "payment/payment";
	}
	
	@RequestMapping("/orderConfirmation")
	public String OrderConfirmation() {
		log.info("OrderConfirmation() 실행");
		return "payment/orderConfirmation";
	}
}
