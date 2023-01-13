package paw.togaether.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	public void insertBreed(Map<String, Object> map) {
		insert("join.insertBreed", map);		
		
	}

	public void insertMembers(Map<String, Object> map) throws Exception {
		insert("join.insertMembers", map);	
	}
	
	

}
