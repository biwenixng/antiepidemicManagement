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
    public void run1(){
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

}
