package com.hafrans.bank.member.controller;

import java.security.InvalidParameterException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hafrans.bank.member.beans.domain.CmInfoWork;
import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.beans.vo.GenericResultVO;
import com.hafrans.bank.member.service.CmInfoWorkService;
import com.hafrans.bank.utils.constraints.SessionConstraints;
import com.hafrans.bank.utils.toolkit.BeansToolkit;

@Controller("memberWorkMgr")
@RequestMapping("/Member/WorkMgr")
@SessionAttributes({ SessionConstraints.LOGIN_ENTITY })
public class WorkMgrController {

	@Autowired
	private CmInfoWorkService service;
	
	@Value("${defaultPageSize}")
	private int pageSize;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addCustomFormatter(new Formatter<java.sql.Date>() {

			private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			@Override
			public String print(Date arg0, Locale arg1) {
				return sdf.format(arg0);
			}

			@Override
			public Date parse(String arg0, Locale arg1) throws ParseException {
				return new java.sql.Date(sdf.parse(arg0).getTime());
			}
		});
	}

	@RequestMapping(value = { "/index", "/" })
	public String index(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model,
						@RequestParam(value = "cmid", required = false) String cmid,
						@RequestParam(value = "", required = false) Date cmdate,
						@ModelAttribute(value = SessionConstraints.LOGIN_ENTITY) YcMember member) {
		if(page <= 0){
			page = 1;
		}
		PageHelper.startPage(page,pageSize);
		List<CmInfoWork> list = null;
		if (cmid != null || cmdate != null) {

			if (member.getRoleId().contentEquals("1")) {
				list = service.findByInfo(cmid, cmdate);
			} else {
				list = service.findByInfoLimited(cmid, cmdate, member.getId() + "");
			}

		} else {
			if (member.getRoleId().contentEquals("1")) {
				list = service.findAll();
			} else {
				list =  service.findByLimited(member.getId());
			}
		}
		System.out.println(list);
		Page<CmInfoWork> info = (Page<CmInfoWork>) list;
		model.addAttribute("list", list);
		model.addAttribute("total", info.getTotal());
		model.addAttribute("current", info.getPageNum());
		model.addAttribute("max", info.getPages());
		info.close();

		return "member/workmgr/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "member/workmgr/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public GenericResultVO add(CmInfoWork work, HttpSession session) {
		System.out.println(work);
		work.setId(((YcMember) session.getAttribute(SessionConstraints.LOGIN_ENTITY)).getId());
		try {
			service.addOne(work);
		} catch (Exception e) {
			e.printStackTrace();
			return new GenericResultVO(0, e.getMessage(), new java.util.Date());
		}
		return new GenericResultVO(1, "添加成功！", new java.util.Date());
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(int id, Model model) {
		CmInfoWork work = service.find(id);
		if (work == null) {
			throw new InvalidParameterException("输入数据有误！");
		}
		model.addAttribute("entity", work);
		return "member/workmgr/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateSubmit(CmInfoWork tmp) throws Exception {

		if (tmp.getKey() == 0) {
			throw new InvalidParameterException("不存在key");
		}

		try {
			CmInfoWork newWork = BeansToolkit.populate(tmp, service.find(tmp.getKey()));
			System.out.println(newWork);
			if (!service.update(newWork)) {
				throw new Exception("update failed.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/Member/WorkMgr/";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public GenericResultVO deleteBatch(@RequestParam("id[]") List<Integer> id) {

		try {
			if (service.delete(id) == id.size()) {
				return new GenericResultVO(1, "删除成功", new java.util.Date());
			} else {
				return new GenericResultVO(0, "删除有部分失败", new java.util.Date());
			}

		} catch (Exception e) {
			return new GenericResultVO(0, e.getMessage(), new java.util.Date());
		}

	}

}
