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
	
	@RequestMapping("cart/insert.do")
	public String insert(@ModelAttribute CartVO vo,HttpSession session)
	{
		String id= (String) session.getAttribute("id");
		vo.setId(id);
		
		// 기존에 담았는지 (국내도서,해외도서,중고도서,클래스)?
		int dcount = cDao.dBeforeInCart(vo.getDombookno(), id);
		dcount == 0? cDao.updateCartD(vo) : cDao.productsInCart(vo);
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
		
		int fcount = cDao.fBeforeInCart(vo.getForbookno(), id);
		fcount == 0? cDao.updateCartF(vo) : cDao.productsInCart(vo);
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
		
		int ucount = cDao.uBeforeInCart(vo.getUsedbookno(), id);
		ucount == 0? cDao.updateCartU(vo) : cDao.productsInCart(vo);
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
		
		int vcount = cDao.cBeforeInCart(vo.getClassno(), id);
		vcount == 0? cDao.updateCartC(vo) : cDao.productsInCart(vo);
		if(vcount == 0)
		{
			// insert
			cDao.productsInCart(vo);
		}
		else
		{
			//update
			cDao.updateCartC(vo);
		}
		return "redirect:cart/list.do";
	}
	
	// 목록
	@GetMapping("cart/list.do")
	public String list(HttpSession session, Model model)
	{
		String id=(String)session.getAttribute("id"); // 세션에 저장된 id
		Map<String, List> map=new HashMap<String, List>();
		List<CartVO> clist=cDao.CartList(id); // 장바구니 정보
		if(clist.size()==0) // 카트에 저장된 상품이 없는 경우
		{
			return null; 
		}
		map.put("clist", clist);
		//map.put("count", clist.size()); // 장바구니 상품의 유무
		session.setAttribute("clist", clist); // 장바구니 정보 세션에 저장?
		model.addAttribute("clist", clist);
		return "main/main";
	}
	
	
	
	// 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cartno)
	{
		cDao.DeleteCart(cartno);
		return "redirect:cart/list.do";
	}
	
	
	// 수정
	@RequestMapping("update.do")
	public String update(@RequestParam int[] qty, @RequestParam int[] dombookno, @RequestParam int[] forbookno, @RequestParam int[] usedbookno, @RequestParam int[] classno, HttpSession session)
	{
		// 세션 id
		String id=(String)session.getAttribute("id");
		// 레코드의 갯수 만큼 반복문 실행?
		for(int i=0; i<dombookno.length; i++)
		{
			CartVO vo = new CartVO();
			vo.setId(id);
			vo.setQty(qty[i]);
			vo.setDombookno(dombookno[i]);
			cDao.dModifyCart(vo);
		}
		for(int j=0; j<forbookno.length; j++)
		{
			CartVO vo = new CartVO();
			vo.setId(id);
			vo.setQty(qty[j]);
			vo.setForbookno(forbookno[j]);
			cDao.fModifyCart(vo);
		}
		for(int k=0; k<usedbookno.length; k++)
		{
			CartVO vo = new CartVO();
			vo.setId(id);
			vo.setQty(qty[k]);
			vo.setUsedbookno(usedbookno[k]);
			cDao.uModifyCart(vo);
		}
		for(int h=0; h<classno.length; h++)
		{
			CartVO vo = new CartVO();
			vo.setId(id);
			vo.setQty(qty[h]);
			vo.setClassno(classno[h]);
			cDao.cModifyCart(vo);
		}
		return "redirect:cart/list.do";
	}
}

























