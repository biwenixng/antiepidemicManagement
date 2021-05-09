package cn.itcast.test;

import cn.itcast.dao.ForwardDao;
import cn.itcast.domain.AUserLogin;
import cn.itcast.domain.AUserRegistered;
import cn.itcast.domain.Forward;
import cn.itcast.service.DoctorService;
import cn.itcast.service.ForwardService;
import cn.itcast.service.impl.UserLogin;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestSpring {

    /**
     * login方法
     */
    @Test
    public void login(){
        // 加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        UserLogin as = (UserLogin) ac.getBean("userService");
//        AccountService as = (AccountService) ac.getBean("accountService");
//        // 调用方法
        AUserLogin newLogin = new AUserLogin();
        newLogin.setUsername("a12345");
        newLogin.setUserpassword("af8f9dffa5d420fbc249141645b962ee");
        as.userLogin(newLogin);
    }

    @Test
    public void  findSchool(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        as.findSchool();
    }
    @Test
    public void  findFloor(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        as.findFloor("西校区");
    }

    @Test
    public void  findDormitory(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        as.findDormitory("12舍");
    }

    @Test
    public void  userIdNumber(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        as.userIdNumber("430623199905116111");
    }

    @Test
    public void  userPhone(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        as.userPhone("17873676272");
    }

    @Test
    public void  userRegistered(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserLogin as = (UserLogin) ac.getBean("userService");
        AUserRegistered aUserLogin = new AUserRegistered();
        aUserLogin.setIdnumber("11111");
        aUserLogin.setUsername("111111");
        aUserLogin.setPassword("111111");
        aUserLogin.setPhone("11111111");
        as.userRegistered(aUserLogin);
    }

    @Test
    public void  queryDoctorAll(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        DoctorService as = (DoctorService) ac.getBean("doctorServiceImpl");
        as.queryDoctorAll();
    }

    @Test
    public void  queryForwardAll(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        ForwardDao as = (ForwardDao) ac.getBean("forwardDao");
        List<Forward> queryForwardAll =  as.queryForwardAll("aaa123");
    }

}
