package com.smj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.smj.orm.Affiche;
import com.smj.service.IAfficheService;
/**    
 *         
 * Class Name：
 *			AfficheServiceImpl    
 * Description：    
 *			描述
 * Author：	cwl
 * Date：	2013-9-16 上午10:57:16    
 * @version	
 *     
 */
@Service("IAfficheService")
public class AfficheServiceImpl extends AbstractService  implements IAfficheService{

	@Override
	public void add(Affiche obj) {
		// TODO Auto-generated method stub
		this.getDao().save(obj);
		
	}
	@Override
	public List<Affiche> findAffiche(Map map) {
		return this.getDao().findAfficeInfo(map);
	}
	@Override
	public void del(Affiche obj) {
		// TODO Auto-generated method stub
		this.getDao().delete(obj);
	}   
}
