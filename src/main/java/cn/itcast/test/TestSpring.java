package cn.itcast.test;

import cn.itcast.domain.AUserLogin;
import cn.itcast.service.impl.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpring {

    /**
     * login方法
     */
    @Test
    public void login(){
        // 加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        UserService as = (UserService) ac.getBean("userService");
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
        UserService as = (UserService) ac.getBean("userService");
        as.findSchool();
    }
    @Test
    public void  findFloor(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService as = (UserService) ac.getBean("userService");
        as.findFloor("西校区");
    }

    @Test
    public void  findDormitory(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService as = (UserService) ac.getBean("userService");
        as.findDormitory("12舍");
    }

    @Test
    public void  userIdNumber(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService as = (UserService) ac.getBean("userService");
        as.userIdNumber("430623199905116111");
    }

    @Test
    public void  userPhone(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService as = (UserService) ac.getBean("userService");
        as.userPhone("17873676272");
    }

    @Test
    public void  userRegistered(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService as = (UserService) ac.getBean("userService");
        AUserLogin aUserLogin = new AUserLogin();
        aUserLogin.setIdnumber();
        aUserLogin.getUsername();
        aUserLogin.setUserpassword();
        aUserLogin.setUserpassword();
        as.userRegistered()
    }

}
