package com.smj.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 顾客信息表封装实体
 * 对应表Cust_info
 * 
 * 
 * */
@Entity
@Table(name="cust_info")
public class Cust_info implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6475786959095202804L;
	
	private Integer cust_id;//
	private String name;//真实姓名
	private String nick_name;//昵称
	private String is_cert;//是否认证
	private String mobile;//手机
	private String phone;
	private String email;//EMAIL
	private String qq;//QQ
	private String pwd;//密码
	private Integer accu;//用户积分
	private Integer is_validate;//是否验证
	private Integer user_rank;//用户诚信度
	private Date reg_date;//注册日期
	private String radom_str1;//随机字符串1
	private String radom_str2;//随机字符串2
	private String user_state;//用户状态
	
	public Cust_info(){}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cust_id",unique=true,nullable=false)
	public Integer getCust_id() {
		return cust_id;
	}

	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getIs_cert() {
		return is_cert;
	}

	public void setIs_cert(String is_cert) {
		this.is_cert = is_cert;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getAccu() {
		return accu;
	}

	public void setAccu(Integer accu) {
		this.accu = accu;
	}

	public Integer getIs_validate() {
		return is_validate;
	}

	public void setIs_validate(Integer is_validate) {
		this.is_validate = is_validate;
	}

	public Integer getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(Integer user_rank) {
		this.user_rank = user_rank;
	}
	@Temporal( TemporalType.DATE)
	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getRadom_str1() {
		return radom_str1;
	}

	public void setRadom_str1(String radom_str1) {
		this.radom_str1 = radom_str1;
	}

	public String getRadom_str2() {
		return radom_str2;
	}

	public void setRadom_str2(String radom_str2) {
		this.radom_str2 = radom_str2;
	}

	public String getUser_state() {
		return user_state;
	}

	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	
	
	
	
	

}
