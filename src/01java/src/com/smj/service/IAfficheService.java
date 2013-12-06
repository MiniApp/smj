package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.Affiche;

public interface IAfficheService {
	@SuppressWarnings("rawtypes")
	public void add(Affiche obj);
	@SuppressWarnings("rawtypes")
	public List<Affiche> findAffiche(Map map);
	@SuppressWarnings("rawtypes")
	public void del(Affiche obj);
}
