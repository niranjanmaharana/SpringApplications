package com.rxprism.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.rxprism.dao.UserDao;
import com.rxprism.util.Constants;
import com.rxprism.util.HibernateUtil;
import com.rxprism.util.PasswordEncryptor;
import com.rxprism.vo.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl  extends HibernateUtil<Integer, User> implements UserDao{
	
	@SuppressWarnings("unchecked")
	public User getUserByCredentail(String userName, String password) {
		List<User> users = new ArrayList<User>();
		users = getSession().createQuery("from User where userName = :username and password = :password")
				.setParameter("username", userName)
				.setParameter("password", PasswordEncryptor.encrypt(password)).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		Criteria criteria = createEntityCriteria();
		return (List<User>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	public List<User> getAllDoctors() {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("role.roleId", Constants.USER_ROLE_DOCTOR));
		return (List<User>) criteria.list();
	}
	public boolean insertUser(User user) {
		try {
			user.setPassword(PasswordEncryptor.encrypt(user.getPassword()));
			user.setActive(true);
			getSession().saveOrUpdate(user);
			return true;
		}catch(Exception exception) {
			return false;
		}
	}
	public User getUserById(int userId) {
		try {
			User user = getByKey(userId);
			return user;
		}catch(Exception exception) {
			return null;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(PasswordEncryptor.encrypt("admin"));
	}
}