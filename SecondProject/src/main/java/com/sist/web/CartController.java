package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.CartDAO;
import com.sist.vo.CartVO;

@Controller
public class CartController {
	@Autowired
	private CartDAO cDao;
	
	@PostMapping("cart/dinput.do")
	public String cart_dinput(int no, String price, int su,HttpSession session, Model model)
	{
		String id= (String) session.getAttribute("id");
		String address= (String) session.getAttribute("address");
		String tel= (String) session.getAttribute("tel");
		String email= (String) session.getAttribute("email");
		String sp=price.replaceAll("[^0-9]", "");
		int type=1;
		
		System.out.println("id:"+id);
		System.out.println("address:"+address);
		System.out.println("tel:"+tel);
		System.out.println("email:"+email);
		System.out.println("sp:"+sp);
		
		int total=Integer.parseInt(sp)*su;
		/*
		 * #{cartno},
		#{id},
		#{type},
		#{productno},
		#{qty},
		SYSDATE,
		#{total_price},
		#{address},
		#{tel},
		#{email},
		 */
		CartVO vo=new CartVO();
		vo.setId(id);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setQty(su);
		vo.setTotal_price(total);
		vo.setPrice(Integer.parseInt(sp));
		vo.setProductno(no);
		vo.setType(type);
		

		// 기존에 담았는지 (국내도서)?
		int dcount = cDao.dBeforeInCart(vo.getProductno(), id);
		if(dcount == 0)
		{
			// insert
			cDao.productsInCart(vo);
		}
		else
		{
			//update
			cDao.updateCartD(vo);
		}
		
		return "redirect:../cart/list.do";
	}
	
	@PostMapping("cart/finput.do")
	public String cart_finput(int no, String price, int su,HttpSession session, Model model)
	{
		String id= (String) session.getAttribute("id");
		String address= (String) session.getAttribute("address");
		String tel= (String) session.getAttribute("tel");
		String email= (String) session.getAttribute("email");
		String sp=price.replaceAll("[^0-9]", "");
		int type=2;
		
		System.out.println("id:"+id);
		System.out.println("address:"+address);
		System.out.println("tel:"+tel);
		System.out.println("email:"+email);
		System.out.println("sp:"+sp);
		
		int total=Integer.parseInt(sp)*su;
		
		CartVO vo=new CartVO();
		vo.setId(id);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setQty(su);
		vo.setTotal_price(total);
		vo.setPrice(Integer.parseInt(sp));
		vo.setProductno(no);
		vo.setType(type);
		
		
		// 기존에 담았는지 (해외도서)?
		int fcount = cDao.fBeforeInCart(vo.getProductno(), id);
		if(fcount == 0)
		{
			// insert
			cDao.productsInCart(vo);
		}
		else
		{
			//update
			cDao.updateCartF(vo);
		}
		
		return "redirect:../cart/list.do";
	}
	
	@PostMapping("cart/uinput.do")
	public String cart_uinput(int no, String price, int su, HttpSession session, Model model)
	{
		String id= (String) session.getAttribute("id");
		String address= (String) session.getAttribute("address");
		String tel= (String) session.getAttribute("tel");
		String email= (String) session.getAttribute("email");
		String sp=price.replaceAll("[^0-9]", "");
		int type=3;
		
		System.out.println("id:"+id);
		System.out.println("address:"+address);
		System.out.println("tel:"+tel);
		System.out.println("email:"+email);
		System.out.println("sp:"+sp);
		
		int total=Integer.parseInt(sp)*su;
		System.out.println("total:"+total);
		
		CartVO vo=new CartVO();
		vo.setId(id);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setQty(su);
		vo.setTotal_price(total);
		vo.setPrice(Integer.parseInt(sp));
		vo.setProductno(no);
		vo.setType(type);
		
		
		// 기존에 담았는지 (중고도서)?
		int ucount = cDao.uBeforeInCart(vo.getProductno(), id);
		if(ucount == 0)
		{
			// insert
			cDao.productsInCart(vo);
		}
		else
		{
			//update
			cDao.updateCartU(vo);
		}
		
		return "redirect:../cart/list.do";
		
		
		
		
	}
	
	@PostMapping("cart/vinput.do")
	public String cart_vinput(int no,String price, int su,HttpSession session, Model model)
	{
		String id= (String) session.getAttribute("id");
		String address= (String) session.getAttribute("address");
		String tel= (String) session.getAttribute("tel");
		String email= (String) session.getAttribute("email");
		String sp=price.replaceAll("[^0-9]", "");
		int type=4;
		
		System.out.println("id:"+id);
		System.out.println("address:"+address);
		System.out.println("tel:"+tel);
		System.out.println("email:"+email);
		System.out.println("sp:"+sp);
		
		int total=Integer.parseInt(sp)*su;
		
		CartVO vo=new CartVO();
		vo.setId(id);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setQty(su);
		vo.setTotal_price(total);
		vo.setPrice(Integer.parseInt(sp));
		vo.setProductno(no);
		vo.setType(type);
		
		
		// 기존에 담았는지(클래스)?
		int vcount = cDao.vBeforeInCart(vo.getProductno(), id);
		if(vcount == 0)
		{
			// insert
			cDao.productsInCart(vo);
		}
		else
		{
			//update
			cDao.updateCartV(vo);
		}
		return "redirect:../cart/list.do";
	}
	
	
	// 목록
	/*
	@GetMapping("cart/list.do")
	public String cart_list(HttpSession session, Model model)
	{
		String id=(String)session.getAttribute("id"); // 세션에 저장된 id
		List<CartVO> clist=cDao.CartListData(id); // d 장바구니 정보
		System.out.println("clist:"+clist.size());
		
		model.addAttribute("clist", clist);
		model.addAttribute("main_jsp","../cart/list.jsp");
		return "main/main";
	}
	*/
	
	
	@GetMapping("cart/list.do")
	public String cart_list(HttpSession session, Model model)
	{
		String id=(String)session.getAttribute("id"); // 세션에 저장된 id
		List<CartVO> dclist=cDao.dCartList(id); // d 장바구니 정보
		List<CartVO> uclist=cDao.uCartList(id); // u장바구니 정보
		List<CartVO> fclist=cDao.fCartList(id); // f장바구니 정보
		List<CartVO> vclist=cDao.vCartList(id); // v장바구니 정보
		
		System.out.println("dclist:"+dclist.size());
		System.out.println("fclist:"+fclist.size());
		System.out.println("uclist:"+uclist.size());
		System.out.println("vclist:"+vclist.size());
		/*
		if(dclist.size()==0) // 카트에 저장된 상품이 없는 경우
		{
			return null; 
		}
		if(uclist.size()==0) // 카트에 저장된 상품이 없는 경우
		{
			return null; 
		}
		if(fclist.size()==0) // 카트에 저장된 상품이 없는 경우
		{
			return null; 
		}
		if(vclist.size()==0) // 카트에 저장된 상품이 없는 경우
		{
			return null; 
		}
		*/
		//map.put("count", clist.size()); // 장바구니 상품의 유무
		//session.setAttribute("clist", clist); // 장바구니 정보 세션에 저장?
		model.addAttribute("dclist", dclist);
		model.addAttribute("uclist", uclist);
		model.addAttribute("fclist", fclist);
		model.addAttribute("vclist", vclist);
		model.addAttribute("main_jsp","../cart/list.jsp");
		return "main/main";
	}
	
	
	
	// 삭제
	@GetMapping("cart/delete.do")
	public String cart_delete(int cartno)
	{
		cDao.DeleteCart(cartno);
		return "redirect:../cart/list.do";
	}
	
	
	
	// 장바구니 내에서 주문하기
	@GetMapping("cart/order_ok.do")
	public String cart_order_ok(int cartno)
	{
		cDao.orderOkUpdate(cartno);
		return "redirect:../cart/list.do";
	}
	
	
	// 관리자 페이지

	@GetMapping("cart/orderAdmin.do")
	public String orderAdmin(Model model)
	{
		List<CartVO> dalist=cDao.adminPageListDataD();
		List<CartVO> falist=cDao.adminPageListDataF();
		List<CartVO> ualist=cDao.adminPageListDataU();
		List<CartVO> valist=cDao.adminPageListDataV();
		model.addAttribute("dalist",dalist);
		model.addAttribute("falist",falist);
		model.addAttribute("ualist",ualist);
		model.addAttribute("valist",valist);
		model.addAttribute("main_jsp", "../cart/orderAdmin.jsp");
		return "main/main";
	}
	
	@GetMapping("cart/orderAdmin_ok.do")
	public String cart_admin_ok(int cartno)
	{
		cDao.adminOkUpdate(cartno);
		return "redirect:../cart/orderAdmin.do";
	}
	
}

























