package com.smj.orm;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品信息表封装实体
 * 对应表Comm_info
 * 
 * 
 * */
@Entity
@Table(name="Comm_info")
public class Comm_info implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1573683397110274970L;
	
	private Integer commd_id;//商品ID
	private Integer store_id;//店铺ID
	private String commd_name;//商品名称
	private String commd_logo;//商品LOGO
	private String img1;//商品图片1
	private String img2;//商品图片2
	private String img3;//商品图片3
	private String one_dimension;//一维码
	private String two_dimension;//二维码
	private Integer u_id;//商品单位
	private String commd_weight;//商品重量
	private String commd_license;//生成许可证号
	private String commd_crea_date;//生产日期
	private String commd_produce_place;//产地
	private String commd_size;//商品规格
	private String commd_description;//商品描述
	private Double agora_price;//市场价
	private Double user_price;//会员价
	private Double sale_price;//销售价
	private Double prom_price;//促销价
	private String taste;//口味
	private String equip;//配品
	private Integer integral;//积分
	private Integer mix_num;//日销售上限
	private Integer have_num;//剩余数量
	private String qualified;//合格标志
	private Integer uses;//上下架标志
	private Integer number;//数量
	private Integer memo;//备注1
	private String remark1;//预留字段1
	private String remark2;//预留字段2
	private String remark3;//预留字段3
	private String remark4;//预留字段4
	private String remark5;//预留字段5
	
	
	
	public Comm_info(){}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="commd_id",unique=true,nullable=false)
	public Integer getCommd_id() {
		return commd_id;
	}



	public void setCommd_id(Integer commd_id) {
		this.commd_id = commd_id;
	}



	public Integer getStore_id() {
		return store_id;
	}



	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}



	public String getCommd_name() {
		return commd_name;
	}



	public void setCommd_name(String commd_name) {
		this.commd_name = commd_name;
	}



	public String getCommd_logo() {
		return commd_logo;
	}



	public void setCommd_logo(String commd_logo) {
		this.commd_logo = commd_logo;
	}



	public String getImg1() {
		return img1;
	}



	public void setImg1(String img1) {
		this.img1 = img1;
	}



	public String getImg2() {
		return img2;
	}



	public void setImg2(String img2) {
		this.img2 = img2;
	}



	public String getImg3() {
		return img3;
	}



	public void setImg3(String img3) {
		this.img3 = img3;
	}



	public String getOne_dimension() {
		return one_dimension;
	}



	public void setOne_dimension(String one_dimension) {
		this.one_dimension = one_dimension;
	}



	public String getTwo_dimension() {
		return two_dimension;
	}



	public void setTwo_dimension(String two_dimension) {
		this.two_dimension = two_dimension;
	}



	public Integer getU_id() {
		return u_id;
	}



	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}



	public String getCommd_weight() {
		return commd_weight;
	}



	public void setCommd_weight(String commd_weight) {
		this.commd_weight = commd_weight;
	}



	public String getCommd_license() {
		return commd_license;
	}



	public void setCommd_license(String commd_license) {
		this.commd_license = commd_license;
	}



	public String getCommd_crea_date() {
		return commd_crea_date;
	}



	public void setCommd_crea_date(String commd_crea_date) {
		this.commd_crea_date = commd_crea_date;
	}



	public String getCommd_produce_place() {
		return commd_produce_place;
	}



	public void setCommd_produce_place(String commd_produce_place) {
		this.commd_produce_place = commd_produce_place;
	}



	public String getCommd_size() {
		return commd_size;
	}



	public void setCommd_size(String commd_size) {
		this.commd_size = commd_size;
	}



	public String getCommd_description() {
		return commd_description;
	}



	public void setCommd_description(String commd_description) {
		this.commd_description = commd_description;
	}



	public Double getAgora_price() {
		return agora_price;
	}



	public void setAgora_price(Double agora_price) {
		this.agora_price = agora_price;
	}



	public Double getUser_price() {
		return user_price;
	}



	public void setUser_price(Double user_price) {
		this.user_price = user_price;
	}



	public Double getSale_price() {
		return sale_price;
	}



	public void setSale_price(Double sale_price) {
		this.sale_price = sale_price;
	}



	public Double getProm_price() {
		return prom_price;
	}



	public void setProm_price(Double prom_price) {
		this.prom_price = prom_price;
	}



	public String getTaste() {
		return taste;
	}



	public void setTaste(String taste) {
		this.taste = taste;
	}



	public String getEquip() {
		return equip;
	}



	public void setEquip(String equip) {
		this.equip = equip;
	}



	public Integer getIntegral() {
		return integral;
	}



	public void setIntegral(Integer integral) {
		this.integral = integral;
	}



	public Integer getMix_num() {
		return mix_num;
	}



	public void setMix_num(Integer mix_num) {
		this.mix_num = mix_num;
	}



	public Integer getHave_num() {
		return have_num;
	}



	public void setHave_num(Integer have_num) {
		this.have_num = have_num;
	}



	public String getQualified() {
		return qualified;
	}



	public void setQualified(String qualified) {
		this.qualified = qualified;
	}



	public Integer getUses() {
		return uses;
	}



	public void setUses(Integer uses) {
		this.uses = uses;
	}



	public Integer getNumber() {
		return number;
	}



	public void setNumber(Integer number) {
		this.number = number;
	}



	public Integer getMemo() {
		return memo;
	}



	public void setMemo(Integer memo) {
		this.memo = memo;
	}



	public String getRemark1() {
		return remark1;
	}



	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}



	public String getRemark2() {
		return remark2;
	}



	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}



	public String getRemark3() {
		return remark3;
	}



	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}



	public String getRemark4() {
		return remark4;
	}



	public void setRemark4(String remark4) {
		this.remark4 = remark4;
	}



	public String getRemark5() {
		return remark5;
	}



	public void setRemark5(String remark5) {
		this.remark5 = remark5;
	}
	
	
	
}
