package com.ming.project.bookstore.store.order;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;

@Controller
@RequestMapping("/store")
public class OrderController {
	
	@Autowired
	private BookBO bookBO;

	@GetMapping("/order/view")
	public String orderView(
			@RequestParam("isbn") String isbn
			, @RequestParam("count") int count
			, Model model) {
		
		JSONObject bookDetail = bookBO.getBookDetail(isbn);
		
		model.addAttribute("bookDetail", bookDetail);
		model.addAttribute("isbn", isbn);
		model.addAttribute("count", count);
		
		return "store/order/order";
	}
	
	@GetMapping("/order/result/view")
	public String orderResultView() {
		return "store/order/order-result";
	}
}
