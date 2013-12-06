package com.smj.web.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import com.smj.orm.Region;
import com.smj.service.IUserService;
import com.smj.util.Common;

 
public class RegisterAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(RegisterAction.class);
	@Resource(name = "IUserService")
	private IUserService userService;
	

	/**
	 * 验证码
	 */
	public ActionForward seccode(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String seccode = mkSeccode();
		request.getSession().setAttribute("seccode", seccode);// session保存值
		int width = 100, height = 30;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(getRandColor(200, 235));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.BOLD, 22));
		for (int i = 0; i < 4; i++) {
			g.setColor(new Color(20 + Common.rand(110), 20 + Common.rand(110),
					20 + Common.rand(110)));
			int x = Common.rand(width);
			int y = Common.rand(height);
			int xl = Common.rand(width);
			int yl = Common.rand(height);
			g.drawLine(x, y, x + xl, y + yl);
		}
		for (int i = 0; i < 4; i++) {
			char rand = seccode.charAt(i);
			g.setColor(getRandColor(10, 150));
			g.drawString(String.valueOf(rand), 24 * i + Common.rand(4),
					22 + Common.rand(6));
		}
		g.dispose();
		try {
			response.setContentType("image/JPEG");
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 随机生成验证码串
	 * 
	 * @return
	 */
	private String mkSeccode() {
		int seccode = Integer.parseInt(Common.getRandStr(6, true));
		String s = Integer.toString(seccode, 24);
		while (s.length() < 4) {
			s = "0" + s;
		}
		String seccodeUnits = "bcefghjkmpqrtvwxy2346789";
		StringBuffer secCodeHiddenBuf = new StringBuffer(4);
		for (int i = 0; i < 4; i++) {
			int unit = s.charAt(i);
			if (unit >= 0x30 && unit <= 0x39) {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x30));
			} else {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x57));
			}
		}
		return secCodeHiddenBuf.toString();
	}

	private Color getRandColor(int fc, int bc) {
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + Common.rand(bc - fc);
		int g = fc + Common.rand(bc - fc);
		int b = fc + Common.rand(bc - fc);
		return new Color(r, g, b);
	}

	

	public ActionForward querySeccode(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String seccode = (String) request.getSession().getAttribute("seccode");

		response.getWriter().write(seccode);
		return null;
	}
    
	/*
	 *   根据区域ID查询区域信息
	 * */
	public ActionForward queryRegion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String fid = request.getParameter("fid");
		
		List schList = new ArrayList();
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","parentId");
		condition.put("value",fid);
		schList.add(condition);
		Map map  = new HashMap();
		map.put("schList", schList);
		
		List<Region> lisRegion = userService.findByPid(map);
		
		Document returnXml = DocumentHelper.createDocument();
		Element result = returnXml.addElement("result");
		response.setContentType("text/html;charset=UTF-8");

		for (Region region : lisRegion) {
			Element street = result.addElement("street");
			street.addAttribute("id", region.getClassId());
			street.setText(region.getName());
		}
		response.getWriter().write(result.asXML());
		return null;
	}

	private boolean checkLenth(String str, int sml, int max) {
		if (str == null || str.trim().length() < sml
				|| str.trim().length() > max)
			return true;
		else
			return false;
	}
}