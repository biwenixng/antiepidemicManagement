package cn.itcast.service.impl;

import cn.itcast.dao.UserLoginDao;
import cn.itcast.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("userService")
public class UserLogin {
    @Autowired
	private UserLoginDao userDao;
		public String userLogin(AUserLogin newLogin) {
			AUserLogin login = userDao.userLogin(newLogin);
			if(login==null){
				return  "账号或密码错误";
			}else {
				return "登录成功";
			}
		}
	    //10 09
//		public int userLogin2(String phone) {
//			List<AUserLogin2> login = userDao.userLogin2();
//			for (AUserLogin2 ln : login) {
//				if (ln.getPhone().equals(phone)) {
//					return 1;
//				}
//			}
//			return 0;
//		}
	//用户登录(手机登录，通过手机号码拿到用户名)
		public String phoneFindUserName(String phone) {
			AUserLogin aUserLogin = new AUserLogin();
			aUserLogin.setPhone(phone);
			AUserLogin login = userDao.userLogin(aUserLogin);
			if(login != null){
				return login.getUsername();
			}
			return "无";
		}



		public String doctorLogin(DUserLogin newLogin) {
			DUserLogin login = userDao.doctorLogin(newLogin);
			if(login == null){
				return "账号或密码错误";
			}else if(login.getShow().equals(0)){
				return "该账户被冻结";
			}else{
				return "登录成功";
			}

		}

		//10 09
		public String adminLogin(MUserLogin newLogin) {
			List<MUserLogin> login = userDao.adminLogin();
			for (MUserLogin ln : login) {
				if (ln.getUsername().equals(newLogin.getUsername())) {
					if (ln.getShow().equals("1")) {
						if (ln.getPassword().equals(newLogin.getPassword())) {
							
							return "登录成功";
						} else {
							return "密码错误";
						}
					} else {
						return "该账号被冻结";
					}
				}
			}
			return "管理员名不存在";
		}
    
		//1011
		public String AdminJudge(String username) {
			List<MUserLogin> login = userDao.adminLogin();
			for(MUserLogin k :login) {
				if(username.equals(k.getUsername())) {
					return k.getJuisdiction();
				}
			}
			return "无";
		}

	public String userIdNumber(String idnumber) {
		AUserLogin aUserLogin = new AUserLogin();
		aUserLogin.setIdnumber(idnumber);
		AUserLogin login = userDao.userLogin(aUserLogin);
		if(login != null){
			return "该身份证号码已被注册!";
		}
		return "没问题";
	}
	

	public int userPhone(String phone) {
		AUserLogin aUserLogin = new AUserLogin();
		aUserLogin.setPhone(phone);
		AUserLogin login = userDao.userLogin(aUserLogin);
		if(login != null){
			return 0;
		}
		return 1;
	}
	

	public String userRegistered(String uid) {
		AUserLogin aUserLogin = new AUserLogin();
		aUserLogin.setPhone(uid);
		AUserLogin login = userDao.userLogin(aUserLogin);
		if(login != null){
			return "该用户名已存在!";
		}
		return "成功注册";
		
	}

	/**
	 * 校区
	 * @return
	 */
	public List<School> findSchool() {
		return userDao.findSchool();
	}

	/**
	 * 楼层
	 * @param schoolname
	 * @return
	 */
	 public List<Floor> findFloor(String schoolname) {
		 return userDao.findFloor(schoolname);
	 }
	

	 public List<Dormitory> findDormitory(String floorname) {
		 return userDao.findDormitory(floorname);
	 }

	 public String userRegistered(AUserRegistered user) {
		 int number = userDao.userRegistered(user);
		 if(number == 0) {
			 return "该用户已存在";
		 }else {
			 return "注册成功";
		 }
	 }

	public String userFindPassword1(String phone) {
		List<AUserRegistered> user = userDao.userFindPassword1();
		int number = 0;
	    for(AUserRegistered k : user) {
	    	if(k.getPhone().equals(phone)) {
	    		number = 1;
	    	}
	    }
	    if(number == 0) {
	    	return "该手机号码不存在";
	    }
	    return "该手机号码存在";
	    
	}

	public String userFindPassword2(String phone , String pwd) {
		int number = userDao.userFindPassword2(phone, pwd);
		if(number!=0) {
			return "密码重置成功";
		}
		return "重置失败";
		
		
	}

	public String getName(String name) {
		return userDao.getName(name);
	}
	public int forWord(Forward forward) {
		return userDao.forWord(forward);
	}

	public AUserLogin getUser(AUserLogin newLogin){
	   return userDao.userLogin(newLogin);
	}
}
