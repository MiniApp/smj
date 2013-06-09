package com.smj.dao;

import com.smj.orm.UserAddress;

public interface IUserAddressDao {
	public void save(UserAddress transientInstance);
	public UserAddress findById(java.lang.Integer id) ;
}
