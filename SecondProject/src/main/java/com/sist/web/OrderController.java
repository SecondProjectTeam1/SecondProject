package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.CartDAO;
import com.sist.dao.OrderDAO;
import com.sist.vo.BookVO;
import com.sist.vo.BooksVO;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;
@Controller 
public class OrderController {
	@Autowired
	private OrderDAO OrderDAO;
	@Autowired
	private OrderVO OrderVO;
	
	@RequestMapping("order/order.do")
	public String order(HttpServletRequest request, Model model) throws Exception
	{
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		//String clist=(String)session.getAttribute("clist"); // 세션에 저장된 장바구니목록 불러오기
		Map map=(Map)session.getAttribute("map");
		List<CartVO> clist=(List<CartVO>)map.get("clist");
		System.out.println("세션정보:"+clist);
		for(int i=0; i<clist.size();i++)
		{
			CartVO cartVO = clist.get(i);
			int dombookno=cartVO.getDombookno();
			if(dombookno==)
			{
				
			}
		}
		return "redirect:../order/order.do";
		
	}
	
	@RequestMapping("order/payOrder.do")
	public String payOrder(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session=request.getSession();
		MemberVO MemberVO=(MemberVO)session.getAttribute("id");
		String id=MemberVO.getId();
		String ordererhp = MemberVO.getTel();
		List<OrderVO>myOrderList=(List<OrderVO>)session.getAttribute("myOrderList");
		for(int i=0; i<myOrderList.size();i++)
		{
			OrderVO vo=myOrderList.get(i);
			vo.setId(id);
			vo.setRecipient(recipient); // 수령자 이름
			vo.setRecipienthp(recipienthp);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setMemo(memo);
			vo.setDeliveryway();
			vo.setPayment(payment); // 결제방법
			vo.setCardcompany(cardcompany);
			vo.setOrdererhp(ordererhp);
			myOrderList.set(i, vo);
		}
	}
	
}























